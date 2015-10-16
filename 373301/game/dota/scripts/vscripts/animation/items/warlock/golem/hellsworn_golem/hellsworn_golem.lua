-- Workshop Importer [run_anim_base]: Pose sequence
model:CreateSequence(
		  {
				name = "golem_turn_center",
				delta = true,
				fadeInTime = 0,
				fadeOutTime = 0,
				fps = 30,
				framerangesequence = "center_pose",
				cmds = {
					 { cmd = "sequence", sequence = "center_pose", dst = 1 },
					 { cmd = "fetchframe", sequence = "center_pose", frame = 0, dst = 2 },
					 { cmd = "subtract", dst = 1, src = 2 },
					 { cmd = "slerp", dst = 0, src = 1 }
				}
		  }
)
-- Workshop Importer [run_anim_base]: Pose sequence
model:CreateSequence(
		  {
				name = "golem_turn_left",
				delta = true,
				fadeInTime = 0,
				fadeOutTime = 0,
				fps = 30,
				framerangesequence = "left_pose",
				cmds = {
					 { cmd = "sequence", sequence = "left_pose", dst = 1 },
					 { cmd = "fetchframe", sequence = "center_pose", frame = 0, dst = 2 },
					 { cmd = "subtract", dst = 1, src = 2 },
					 { cmd = "slerp", dst = 0, src = 1 }
				}
		  }
)
-- Workshop Importer [run_anim_base]: Pose sequence
model:CreateSequence(
		  {
				name = "golem_turn_right",
				delta = true,
				fadeInTime = 0,
				fadeOutTime = 0,
				fps = 30,
				framerangesequence = "right_pose",
				cmds = {
					 { cmd = "sequence", sequence = "right_pose", dst = 1 },
					 { cmd = "fetchframe", sequence = "center_pose", frame = 0, dst = 2 },
					 { cmd = "subtract", dst = 1, src = 2 },
					 { cmd = "slerp", dst = 0, src = 1 }
				}
		  }
)
-- Workshop Importer [run_anim_base]: Turns sequence
model:CreateSequence(
	  {
			name = "golem_turns",
			delta = true,
		    fadeInTime = 0.2,
			fadeOutTime = 0.2,
			poseParamX = model:CreatePoseParameter( "turn", -1, 1, 0, false ),
			sequences = {
				 { "golem_turn_left", "golem_turn_center", "golem_turn_right" }
			}
	  }
)
-- Workshop Importer [run_anim_base]: Run sequence
model:CreateSequence(
	 {
		  name = "golem_run",
		  looping = true,
		  sequences = {
				{ "@golem_run" }
		  },
		  addlayer = { "golem_turns" },
		  activities = {
				{ name = "ACT_DOTA_RUN", weight = 1 }
		  }
	 }
)
