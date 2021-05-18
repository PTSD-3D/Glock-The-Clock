local SoundType = {
	Sonido = 0,
	Musica = 1
}

local SoundChannel = {
	Ambiente = 0,
	Dialogo = 1,
	General = 2
}

local Resources = {
	PATHS = {
		Sound = "./assets/sounds/"
	},
	Sounds = {
		Fall = {
			path = "Fall.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.General, volume = 0.2
		},
		HitTarget = {
			path = "HitTarget.wav", id, tipo = SoundType.Sonido, soundChannel=SoundChannel.General, volume = 0.3
		},		
		Jump = {
			path = "Jump.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.General, volume = 0.1
		},				
		Select = {
			path = "Select.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.General, volume = 0.3
		},		
		Shoot = {
			path = "Shoot.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.General, volume = 0.3
		},		
		Star = {
			path = "Star.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.General, volume = 0.3
		},		
		LevelCompleted = {
			path = "LevelCompleted.wav", id, tipo=SoundType.Sonido, soundChannel=SoundChannel.General, volume = 0.3
		},

		--Music

		Level1Theme = {
			path = "Level1Theme.wav", id, tipo=SoundType.Musica, volume = 0.05
		},		
		Level2Theme = {
			path = "Level2Theme.wav", id, tipo=SoundType.Musica, volume = 0.05
		},		
		Level3Theme = {
			path = "Level3Theme.wav", id, tipo=SoundType.Musica, volume = 0.05
		},		
		MainMenuTheme = {
			path = "MainMenuTheme.wav", id, tipo=SoundType.Musica, volume = 0.05
		}
	},
	UISchemes = {
		TaharezLookScheme = {
			path = "TaharezLook.scheme", type=UIFileType.Scheme
		}
	},
	UILayouts = {	
		TaiFighterLayout = {
			path = "TaiFighter.layout", type=UIFileType.Layout
		},
		PauseLayout = {
			path = "Pause.layout", type=UIFileType.Layout
		},
		TitleLayout = {
			path = "Title.layout", type=UIFileType.Layout
		}
	},
	Meshes = {
		--si
	}
}
return Resources