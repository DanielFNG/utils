function addMetabolicProbes(model_path, save_path)

    import org.opensim.modeling.*

    osim = Model(model_path);
    osim.initSystem();

    twitch_ratio = 0.5;

    probe = Umberger2010MuscleMetabolicsProbe(true, true, true, true);
    probe.setOperation('value');
    probe.set_report_total_metabolics_only(false);

    osim.addProbe(probe);
    probe.setName('metabolics');

    muscles = osim.getMuscles();

    for i = 0:muscles.getSize() - 1
        muscle = muscles.get(i);
        probe.addMuscle(muscle.getName(), twitch_ratio);
    end

    osim.print(save_path);

end