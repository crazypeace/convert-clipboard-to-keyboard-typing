#F3::
; 快速键 win + f3

    TextToSend := Clipboard
    ; 检查剪贴板是否为空
    if (TextToSend = "") {
        MsgBox, clipboard empty
        Return
    }
    
    DelayMs := 500 ; 设置您想要的延迟时间（毫秒）
    
    ; 调用自定义函数发送文本
    SendTextWithDelay(TextToSend, DelayMs) 
    
    MsgBox, input finished
    Return


; ------------------------------------------------
; 自定义函数：使用 SendInput 逐字符发送，并加入 Sleep 延迟
; ------------------------------------------------
SendTextWithDelay(Text, Delay)
{
    ; 循环遍历文本中的每个字符
    Loop, Parse, Text
    {
        ; A_LoopField 包含当前循环中的单个字符
        SendInput, %A_LoopField%
        
        ; 强制等待指定的毫秒数
        Sleep, %Delay%
    }
}
