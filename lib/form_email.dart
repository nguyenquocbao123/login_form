class FormEmail
{
  String email;
  String pass;
  FormEmail(){
    this.email;
    this.pass;
  }
  bool Condition()
  {
    if(this.email.compareTo(this.pass)==0){
      return true;
    }
    else
      return false;
  }

  bool setEmail(String email)
  {

    if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email))
    {
      this.email=email;
      print('Valid');
      return true;
    }
    else
    {
      print('Invalid email form');
      return false;
    }
  }
}