class AssignmentsController < ApplicationController

  respond_to :json
  
  def create 
    @assignment = Assignment.create(:prof_key => params[:prof_key], :due_date => params[:due_date])
    if(params[:student_keys] != nil)
       student_keys = params[:student_keys][1..-2].split(',').each{|e| e.strip!}
       @assignment.add_student_keys(student_keys)
  	   @assignment.save
    end
    
    if(params[:autograder] != nil)
      @assignment = Assignment.find_by_id(params[:id])
      @assignment.autograder = params[:autograder].tempfile.path
      @assignment.save
    end
    
  end
  
  def add_autograder 
    @assignment = Assignment.find_by_id(params[:id])
    @assignment.autograder = params[:autograder].tempfile.path
    @assignment.save
  end

  def add_student_keys
    @assignment = Assignment.find_by_id(params[:id])
    if(params[:student_keys] != nil)
       @student_keys = params[:student_keys][1..-2].split(',').each{|e| e.strip!}
       @assignment.add_student_keys(@student_keys)
	   @assignment.save
    end
  end
  
  def remove_student_keys
    @assignment = Assignment.find_by_id(params[:id])

    if(params[:student_keys] != nil)
       @student_keys = params[:student_keys][1..-2].split(',').each{|e| e.strip!}
       @assignment.remove_student_keys(@student_keys)
	   @assignment.save
    end
  end
  
  def change_due_date
    @assignment = Assignment.find_by_id(params[:id])
    if(params[:due_date] != nil)
      @assignment.change_due_date(params[:due_date])
      @assignment.save
    end 
  end
  
  def submit
    @assignment = Assignment.find_by_id(params[:id])
    @student = @assignment.students.find_by_student_key(params[:student_key])
    if(@student != nil)
      @student.add_submission(params[:submission])
      @student.save()
      @submission_successful = true
    else
      @submission_successful = false
    end
  end
  
  def retrieve_submissions_by_status
    @assignment = Assignment.find_by_id(params[:id])
    @submissions = @assignment.submissions.find_all_by_status(params[:status])
  end

  def retrieve_all_submissions
    @assignment = Assignment.find_by_id(params[:id])
    @submissions = @assignment.submissions
  end
  
  def retrieve_submission_by_student_key
    @assignment = Assignment.find_by_id(params[:id])
		@student = @assignment.students.find_by_student_key(params[:student_key])
    if(@student != nil)
      @submissions = @student.submissions 
      @student_key_valid = true
    else
      @student_key_valid = false
    end    
  end
  
end
