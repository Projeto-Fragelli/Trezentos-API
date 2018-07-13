namespace :trezentos_api do
  
  task reset: :environment do
    Rake::Task["db:drop"].execute
    Rake::Task["db:create"].execute
    Rake::Task["db:migrate"].execute
  end

  task init: :environment do
    @student = UserType.new(description:"Aluno")
    if (@student.save)
      @s = UserType.find(@student.id)
       puts "[" + @s.id.to_s +  "] " + @s.description.to_s  + " SALVO COM SUCESSO!"
    end

    @monitor = UserType.new(description:"Monitor")
    if (@monitor.save)
      @s = UserType.find(@monitor.id)
      puts "[" + @s.id.to_s +  "] " + @s.description  + " SALVO COM SUCESSO!"
    end

    @professor = UserType.new(description:"Professor")
    if (@professor.save)
      @s = UserType.find(@professor.id)

       puts "[" + @s.id.to_s +  "] " + @s.description  + " SALVO COM SUCESSO!"
    end

    @grade_normal = GradeType.new(description:"Normal")
    if (@grade_normal.save)
      @s = GradeType.find(@grade_normal.id)

       puts "[" + @s.id.to_s +  "] " + @s.description  + " SALVO COM SUCESSO!"
    end

    @grade_trezentos = GradeType.new(description:"Trezentos")
    if (@grade_trezentos.save)
      @s = GradeType.find(@grade_trezentos.id)

       puts "[" + @s.id.to_s +  "] " + @s.description  + " SALVO COM SUCESSO!"
    end
  end

end
