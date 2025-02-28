using Godot;
using Godot.Collections;
using System;

public partial class Login : Control
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		Node globalValue = GetNode<Node>("/root/GlobalValue");

		Array<String> infoArray = globalValue.Get("infoArray").As<Array<String>>();

		foreach (String text in infoArray)
		{
			Label infoLabel = new();
			infoLabel.Text = text;

			this.AddChild(infoLabel);
		}
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public void _on_certificate_button_pressed()
	{
		GetNode<Window>("CertificateWindow").Visible = true;
	}
}
