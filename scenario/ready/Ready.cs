using Godot;
using System;

public partial class Ready : Control
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		Node globalValue = GetNode<Node>("/root/GlobalValue");

		String osName = OS.GetName();

		globalValue.Set("osName", osName);

		if (!globalValue.Get("isDevelopment").AsBool())
		{
			switch (osName)
			{
				case "Android":

				case "iOS":
					GetTree().ChangeSceneToFile("res://scenario/PE/login/login.tscn");
					break;

				case "macOS":

				case "Windows":
					break;



			}


		}
		else
		{
			GetTree().ChangeSceneToFile("res://scenario/PE/login/login.tscn");
		}
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
