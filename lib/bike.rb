class Bike
    attr_writer :status

    # def status
    #   @status
    # end
    # status=
    # def write_to_status(new_status)
    #   @status = new_status
    # end
    
    def initialize
      @status = true
    end
  
    def working?
      @status == true
    end
  end