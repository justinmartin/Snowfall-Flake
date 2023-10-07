let
  justin = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDIj24tr9NcCrRVFSj1Nk2DSx3gFWHxAWIV36EBh6UDWFtZLtTCDYTDvk/z0okL3Dkhjf2VIIkHuWTCHz7KGKJcxvM+pjdxFl/rLocMOkGn2uIWRbgk+yHnc62ARosy/VQ1UcHswTman8KdlSRU2qjuK3etP26JsKsUhd+/qXr+HSTlcJFrZH+YOVar/K3HklCxOrSXnNSLmJEvbC7s12EgQYiP1J2KLP18LsXmB6aNwpvendeooDZpDayrJ7qxuYJhSjzHTmLoNBxxDe1IuFlH4HdwtnrNI++v4tzfKNA3FnQ6r1CRLtNjrkIjDylI8GrfMr8rLDCEcUUzsXqnuhiMLmQwFNVCfFCmU02G60uuEpZlwxGGrZRCT6MQWu9NRlwIpZ9b/DvAmcBj71CuBtAoZSulVQ1KytvV+vuTp80s04n+YQJTxDLvPoJMXUJ+sTQieib8IfOzwVCNmx98pBvxr71XGEwpPWX2SViD8DYfzND8NLo4eq0WF2eXFBY3p3U= justin@nixos";
  justin_gramarye = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDM6+N204Jtp7DCXE8vS/8ZZsWPWSIkntc4Q6cvOT7Gkj+kI/duJ/UHdpboj/514h7DerF6Y7H5MOFBvltqmZvEY42mK7PRGE/5i5Jnf7rIHkI5a7ju4hJCGvH8I/7cqPuYu/TTe8OuZCDYDb00WMDYzujW/rAHyffBAbfM0609lRSIfBlEY5ijGTksZMWEKzgJpbFXG4XZZju/mLX8O0Hu/PxgDEct7KGpTHYX+pJI9UUL/UQg6KnHxhTBfpdVaX73akyauzL/aXpnFkjHQAixEkupM++pddp16+2k3EtLwHSxspwx//IBTaPIe9pujYPOO5n91DvDeUKuCoJ1jvGy/4iq6Ca7JXLwArbRPrSqET3G1zNPsDY4aekXCwTZ2G/K2Y0VnGPFu3+hfea0aBHEGao/GmAHvkRF+SQI2GPG1B5ZR94DW2PI1mtZigUonrNuyu/X5ax/6uoxEJvV8zKpUj4qb2U+ODzmiNwmxIhyxBxoCraW5z9J+mPcPhxirHk= justin@gramarye";
  jmartin_work = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAneVqURkRoHYLv+KnrJilN9eQ/8vuAl3Gh4z7Pv+b5roDiKdlgDV+s26C/7D3PErBSzkbh08PaYjLMcGA2UfUq36jD4qSVuxB5JWDANt1mU/u2/BKeSXZAt5SoBic0ygh/EtUU2AjtxdoaLFHmhPe1mq5GX7JTRML9DME/bgxETDENBq7iQyCW1gPT+XkYi5jgZ4cmgYj2rQ43XtcfEr8aStZ0w+vuosF5k7zAaI7bgLEf4tj2zYNTqfyMhzwr7Eme1vYa8yvifFhVA7DBQjNaJzj0PfZtInPxhw3MrY8TZ+RCVxjhX68uElkpVlHThX1XaDDBygVpCPhu0KaJN9I3i38HbCc4WziH9KrCnMJAwLHzTp6qX9kFhEonleYXJrkUWCBQm237gp+NW5xucripp9LtStXEExuEFFwFr8zd5U6EjOKJ+3LvkpeVkGXFS0440+zJYmqCK6Y8d45adVY/kzt1JiQeFhR8QpHc7cWtTIktNjVyy+4BYhWu/3iyAE= jmartin@W12-1246";
  users = [ justin justin_gramarye jmartin_work ];


  probook = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKdKBZUeYZFNQicy5D3KEd+OT+XAdZdiT12cWAYkvFfV";
  nixserver = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHdeJJ4dnwOIpLQiA7pfM5sJORcirrg+QFPt4UhuODtp";
  gitnix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO2VdRJiSz7bq05oASu7Y/GTYOmOQAy8e/wCb3cod8US";  
  gramarye = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK4XdS8d1adf+oTe5UQaAmg5PBxVlBV3nRL0Liu3PLHS";
  W12-1246 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIkP0R8BLoNYXboYHhOJCCnHoA8QVtHn4r7KvSwSJR26";
  kitchenixos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDGgUPI9dkcl5KjzJls1wXtM/+Gkd0Uxn013BrGtjSx0";
  pangolin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFn9MH9GM6+R3X1ZYUSGhBjJkx56lJnkXj1Lkas6NER6";
  nixos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINIMevnweWY8ZYCG0S4/TWszrMkUb+7y0bOEgODB77Xa";
  systems = [ probook nixserver gitnix gramarye W12-1246 kitchenixos pangolin nixos];
in
{
  "justin.age".publicKeys = users ++ systems;
  "freshrss_admin.age".publicKeys = users ++ systems;
  "matrix_registration_secret.age".publicKeys = users ++ systems;
  "vultr_api_key.age".publicKeys = users ++ systems;
  "taskwarrior.intheam.ca.cert.age".publicKeys = users ++ systems;
  "taskwarrior.intheam.private.certificate.age".publicKeys = users ++ systems;
  "taskwarrior.intheam.private.key.age".publicKeys = users ++ systems;
  "taskwarrior.ca.cert.age".publicKeys = users ++ systems;
  "taskwarrior.public.certificate.age".publicKeys = users ++ systems;
  "taskwarrior.private.key.age".publicKeys = users ++ systems;
}
