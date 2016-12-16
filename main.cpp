#include <SFML/Graphics.hpp>
int main(int c, char** v)
{
  sf::RenderWindow window(sf::VideoMode(200,200), "SFML works!");
  sf::CircleShape shape(100.0f);
  shape.setFillColor(sf::Color::Green);
  sf::Clock clock;
  sf::Time elapsed;
  bool flag = true;
  while(window.isOpen())
    {
      sf::Event event;
      while(window.pollEvent(event))
	{
	  if(event.type == sf::Event::Closed)
	    {
	      window.close();
	    }
	}
      elapsed = clock.getElapsedTime();
      if(elapsed.asMilliseconds() >= 500)
	{
	  clock.restart();
	  if(flag)
	    {
	      shape.setFillColor(sf::Color::Red);
	      flag = false;
	    }
	  else
	    {
	      shape.setFillColor(sf::Color::Green);
	      flag = true;
	    }
	}
      window.clear();
      window.draw(shape);
      window.display();
    }
  return 0;
  
  
  
}
