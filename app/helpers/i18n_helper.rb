module I18nHelper
  def c2w amount
    currency_to_words amount
  end

  def n2c value, options = {}
    number_to_currency value, options
  end

  def n2d value, options = {}
    number_with_delimiter value, options
  end

  def n2f number, precision = nil
    precision ||= t('number.format.precision').to_i

    number.round precision
  end

  def n2p value, options = {}
    number_to_percentage value, options
  end

  def n2s number, options = {}
    options.reverse_merge! precision: 2

    number_to_human_size number, options
  end
end
