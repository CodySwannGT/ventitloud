module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end
  
  
  def mood_to_css(mood, type='alert')
    moods = {
      Amused: '',
      Angry:  'error',
      Annoyed:  'error',
      Anxious: 'error',
      Ashamed:  'error',
      Bored: '',
      Calm: 'info',
      Confused: '',
      Crazy: '',
      Curious: 'info',
      Cynical:  'error',
      Determined: 'info',
      Disappointed:  'error',
      Drunk: 'info',
      Excited: 'success',
      Frustrated:  'error',
      Good: 'success',
      Guilty:  'error',
      Happy: 'success',
      Hopeful: 'success',
      Hungry: 'info',
      Impressed: 'success',
      Indifferent: '',
      Jealous:  'error',
      Lonely: 'info',
      Loved: 'success',
      Mischievous:  'error',
      Naughty: 'error',
      Nerdy: 'success',
      Okay: '',
      Optimistic: '',
      Peaceful: 'info',
      Pessimistic:  'error',
      Rejected:  'error',
      Relieved: 'success',
      Sad: 'info',
      Sick:  'error',
      Silly: '',
      Sleepy: 'info',
      Smart: 'success',
      Stressed:  'error',
      Surprised: 'info',
      Sympathetic: '',
      Thankful: 'success',
      Tired:  'error',
      Uncomfortable: 'error',
      Weird: 'info'
    }
    
    css = moods[mood.to_sym].to_s
    
    css = css.gsub(/error/,"important") if type == 'label'
    css = css.gsub(/error/,"danger") if type == 'btn'
    
    css
  end

end
