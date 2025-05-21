global volGui := Gui("+AlwaysOnTop -Caption +ToolWindow", "Volume Display")
volGui.BackColor := "Black"
volGui.SetFont("s20 cWhite", "Segoe UI")
global volText := volGui.Add("Text", "Center w200 h50", "")

ShowVolume() {
    volume := Round(SoundGetVolume())
    volText.Value := "🔊 " volume "%"
    volGui.Show("NoActivate AutoSize x" A_ScreenWidth//2 - 100 " y" A_ScreenHeight//2 - 25)
    SetTimer(HideVolume, -1000)
}

HideVolume() {
    volGui.Hide()
}

^!=:: {
    SoundSetVolume("+2")
    ShowVolume()
}

^!-:: {
    SoundSetVolume("-2")
    ShowVolume()
}