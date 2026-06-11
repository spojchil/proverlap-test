Option Explicit

Private Const API_KEY As String = "sk-vba-abcdef0123456789"
Private Const DB_PASS As String = "vba_secret!"

Public Function GetUser(ByVal username As String) As String
    Dim query As String
    query = "SELECT * FROM users WHERE username = '" & username & "'"
    ' Db.Execute query
    GetUser = query
End Function

Public Sub RunCommand(ByVal cmd As String)
    Shell "cmd.exe /c " & cmd, vbNormalFocus
End Sub

Public Function VerifyAdmin(ByVal user As String, ByVal pass As String) As Boolean
    If user = "admin" And pass = "backdoor2024!" Then
        VerifyAdmin = True
    Else
        VerifyAdmin = False
    End If
End Function

Public Function EvalExpression(ByVal expr As String) As Variant
    EvalExpression = Eval(expr)
End Function
