using Godot;
using System;

public partial class CertificateWindow : Window
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		this.Visible = false;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public void _on_close_requested()
	{
		this.Visible = false;
	}
}
