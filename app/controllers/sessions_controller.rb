class SessionsController < Frack::BaseController
  def destroy
    session.clear
    session['flash'] = 'Signed out successfully'
    [302, { 'location' => '/' }, []]
  end
end
