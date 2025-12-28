<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Grade Calculator</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Arial, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            width: 100%;
            max-width: 500px;
            animation: slideIn 0.5s ease-out;
        }
        
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .header {
            background: linear-gradient(to right, #4A00E0, #8E2DE2);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .header h1 {
            font-size: 28px;
            margin-bottom: 10px;
            font-weight: 600;
        }
        
        .header p {
            opacity: 0.9;
            font-size: 16px;
        }
        
        .content {
            padding: 40px;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
            font-size: 16px;
        }
        
        input[type="number"] {
            width: 100%;
            padding: 15px;
            border: 2px solid #e1e5e9;
            border-radius: 10px;
            font-size: 16px;
            transition: all 0.3s;
            background: #f8f9fa;
        }
        
        input[type="number"]:focus {
            border-color: #8E2DE2;
            outline: none;
            background: white;
            box-shadow: 0 0 0 3px rgba(142, 45, 226, 0.1);
        }
        
        .btn {
            background: linear-gradient(to right, #4A00E0, #8E2DE2);
            color: white;
            border: none;
            padding: 16px 32px;
            border-radius: 10px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            width: 100%;
            transition: all 0.3s;
            letter-spacing: 0.5px;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 14px rgba(142, 45, 226, 0.3);
        }
        
        .btn:active {
            transform: translateY(0);
        }
        
        .result-section {
            margin-top: 30px;
            animation: fadeIn 0.5s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        .grade-card {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            border-radius: 15px;
            padding: 25px;
            text-align: center;
            border: 2px solid transparent;
            transition: all 0.3s;
        }
        
        .result-label {
            font-size: 18px;
            color: #555;
            margin-bottom: 15px;
            font-weight: 500;
        }
        
        .grade-display {
            font-size: 60px;
            font-weight: 800;
            margin: 10px 0;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .marks-display {
            font-size: 22px;
            color: #666;
            margin: 10px 0;
        }
        
        .performance {
            font-size: 18px;
            color: #777;
            margin-top: 15px;
            font-style: italic;
        }
        
        /* Grade-specific colors */
        .grade-A {
            color: #27ae60;
            border-color: #27ae60;
        }
        
        .grade-B {
            color: #3498db;
            border-color: #3498db;
        }
        
        .grade-C {
            color: #f39c12;
            border-color: #f39c12;
        }
        
        .grade-D {
            color: #e67e22;
            border-color: #e67e22;
        }
        
        .grade-F {
            color: #e74c3c;
            border-color: #e74c3c;
        }
        
        .grade-invalid {
            color: #7f8c8d;
            border-color: #7f8c8d;
        }
        
        .error-message {
            background: #fee;
            border-left: 4px solid #e74c3c;
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
            color: #c0392b;
            font-weight: 500;
            animation: shake 0.5s;
        }
        
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }
        
        .grading-scale {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin-top: 30px;
            border: 1px solid #e1e5e9;
        }
        
        .grading-scale h3 {
            color: #333;
            margin-bottom: 15px;
            font-size: 18px;
            text-align: center;
        }
        
        .scale-item {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            border-bottom: 1px solid #e1e5e9;
        }
        
        .scale-item:last-child {
            border-bottom: none;
        }
        
        .scale-range {
            font-weight: 500;
            color: #555;
        }
        
        .scale-grade {
            font-weight: 700;
        }
        
        .scale-grade.A { color: #27ae60; }
        .scale-grade.B { color: #3498db; }
        .scale-grade.C { color: #f39c12; }
        .scale-grade.D { color: #e67e22; }
        .scale-grade.F { color: #e74c3c; }
        
        .footer {
            text-align: center;
            padding: 20px;
            color: #666;
            font-size: 14px;
            border-top: 1px solid #e1e5e9;
            background: #f8f9fa;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📚 Student Grade Calculator</h1>
            <p>Enter marks to calculate corresponding grade</p>
        </div>
        
        <div class="content">
            <form method="post">
                <div class="form-group">
                    <label for="marks">Enter Marks (0-100):</label>
                    <input type="number" id="marks" name="marks" min="0" max="100" 
                           step="0.01" placeholder="Enter marks between 0 and 100" required>
                </div>
                
                <button type="submit" class="btn">Calculate Grade</button>
            </form>
            
            <%
                
                String marksStr = request.getParameter("marks");
                String grade = "";
                String performance = "";
                String gradeClass = "";
                boolean showResult = false;
                String error = null;
                
                if (marksStr != null && !marksStr.isEmpty()) {
                    try {
                        double marks = Double.parseDouble(marksStr);
                        
                        
                        if (marks < 0 || marks > 100) {
                            error = "Please enter marks between 0 and 100.";
                        } else {
                            showResult = true;
                            
                            
                            if (marks >= 90) {
                                grade = "A";
                                performance = "Excellent! Outstanding performance.";
                                gradeClass = "grade-A";
                            } else if (marks >= 80) {
                                grade = "B";
                                performance = "Very Good! Keep up the good work.";
                                gradeClass = "grade-B";
                            } else if (marks >= 70) {
                                grade = "C";
                                performance = "Good! There's room for improvement.";
                                gradeClass = "grade-C";
                            } else if (marks >= 60) {
                                grade = "D";
                                performance = "Satisfactory. Needs more effort.";
                                gradeClass = "grade-D";
                            } else {
                                grade = "F";
                                performance = "Needs improvement. Please seek help.";
                                gradeClass = "grade-F";
                            }
                        }
                    } catch (NumberFormatException e) {
                        error = "Please enter a valid number for marks.";
                    }
                }
            %>
            
            <% if (showResult) { %>
                <div class="result-section">
                    <div class="grade-card <%= gradeClass %>">
                        <div class="result-label">Your Grade:</div>
                        <div class="grade-display <%= gradeClass %>"><%= grade %></div>
                        <div class="marks-display">Marks: <%= marksStr %></div>
                        <div class="performance"><%= performance %></div>
                    </div>
                </div>
            <% } else if (error != null) { %>
                <div class="error-message">
                    ⚠️ <%= error %>
                </div>
            <% } %>
            
            <div class="grading-scale">
                <h3>📊 Grading Scale</h3>
                <div class="scale-item">
                    <span class="scale-range">90 - 100 marks</span>
                    <span class="scale-grade A">Grade A</span>
                </div>
                <div class="scale-item">
                    <span class="scale-range">80 - 89 marks</span>
                    <span class="scale-grade B">Grade B</span>
                </div>
                <div class="scale-item">
                    <span class="scale-range">70 - 79 marks</span>
                    <span class="scale-grade C">Grade C</span>
                </div>
                <div class="scale-item">
                    <span class="scale-range">60 - 69 marks</span>
                    <span class="scale-grade D">Grade D</span>
                </div>
                <div class="scale-item">
                    <span class="scale-range">0 - 59 marks</span>
                    <span class="scale-grade F">Grade F</span>
                </div>
            </div>
        </div>
        
        <div class="footer">
             Student Grade Calculator 
        </div>
    </div>
    
    <script>
        // Client-side validation for better UX
        document.querySelector('form').addEventListener('submit', function(e) {
            const marksInput = document.getElementById('marks');
            const marks = parseFloat(marksInput.value);
            
            if (isNaN(marks)) {
                alert('Please enter a valid number for marks.');
                e.preventDefault();
                return;
            }
            
            if (marks < 0 || marks > 100) {
                alert('Marks must be between 0 and 100.');
                e.preventDefault();
                marksInput.focus();
            }
        });
        
        
        document.getElementById('marks').focus();
    </script>
</body>
</html>