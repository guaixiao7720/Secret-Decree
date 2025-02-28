using Godot;
using Godot.Collections;
using System;

public partial class global_value : Node
{
    public String osName;

    protected String certificate;

    public bool isDevelopment = true;

    public Array<String> infoArray = new();

    public override void _Ready()
    {
        

    }
}
