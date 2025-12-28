# Student Grade Calculator

## 🎯 Features

- **Real-time Grade Calculation**: Instant grade evaluation on submission
- **Comprehensive Grading**: A, B, C, D, F grades with performance feedback
- **Input Validation**: client-side validation (0-100 range)
- **Visual Feedback**: Color-coded grades and smooth animations
- **Responsive Design**: Professional UI that works on all devices

## 📊 Grading Scale

```
A: 90 - 100 marks (Excellent)
B: 80 - 89 marks (Very Good)
C: 70 - 79 marks (Good)
D: 60 - 69 marks (Satisfactory)
F: 0 - 59 marks (Needs Improvement)
```

## ⚙️ Core Logic

```java
if (marks >= 90) {
    grade = "A";
} else if (marks >= 80) {
    grade = "B";
} else if (marks >= 70) {
    grade = "C";
} else if (marks >= 60) {
    grade = "D";
} else {
    grade = "F";
}
```

## 📁 File Structure

```
gradeCalculator.jsp    # Complete JSP implementation
```

## 💡 Usage

1. **Enter** student marks (0-100)
2. **Click** "Calculate Grade" button
3. **View** results including:
   - Letter grade (A-F)
   - Marks entered
   - Performance feedback
   - Color-coded visual representation

## 📈 Sample Results

**Input:** 85 marks  
**Output:** Grade B (Very Good! Keep up the good work.)

**Input:** 92 marks  
**Output:** Grade A (Excellent! Outstanding performance.)

## 🔒 Validation Rules

- Marks must be numeric
- Range: 0 to 100 inclusive
- Decimal values accepted
- Required field validation

