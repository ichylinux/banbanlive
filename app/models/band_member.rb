# coding: UTF-8

module BandMemberConst
  
  INSTRUMENTS = {
    VOCAL = 1 => 'ボーカル',
    GUITAR = 2 => 'ギター',
    BASE = 3 => 'ベース',
    KEYBOARD = 4 => 'キーボード',
    DRUM = 5 => 'ドラム',
  }
end

class BandMember < ActiveRecord::Base
  include BandMemberConst

  belongs_to :band
  belongs_to :member

  attr_accessible :deleted, :instrument_id, :member_id

  def instrument_name
    INSTRUMENTS[instrument_id]
  end

  def member_name
    return nil unless member_id
    member.full_name
  end

end
