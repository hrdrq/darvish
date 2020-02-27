class Record
  include Mongoid::Document
  field :league, type: String
  field :type, type: String
  field :dt, type: Date
  field :opp, type: String
  field :home, type: Mongoid::Boolean, default:true
  field :start, type: Mongoid::Boolean, default:true
  field :win, type: Integer, default:0
  field :cg, type: Mongoid::Boolean, default:false
  field :sho, type: Mongoid::Boolean, default:false
  field :sv, type: Mongoid::Boolean, default:false
  field :svo, type: Mongoid::Boolean, default:false
  field :ip, type: Integer, default:0
  field :ip_f, type: Integer, default:0
  field :hit, type: Integer, default:0
  field :run, type: Integer, default:0
  field :er, type: Integer, default:0
  field :hr, type: Integer, default:0
  field :hb, type: Integer, default:0
  field :bb, type: Integer, default:0
  field :ibb, type: Integer, default:0
  field :so, type: Integer, default:0
  field :np, type: Integer, default:-1
  field :np_s, type: Integer, default:-1 
  field :era, type: Float, default:0
  field :whip, type: Float, default:0
end
