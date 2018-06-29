class MyApp::ExceptionPage < ExceptionPage
  def styles
    Styles.new(accent: "purple")
  end
end
