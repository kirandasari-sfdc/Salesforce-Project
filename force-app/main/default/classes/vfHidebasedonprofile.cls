public class vfHidebasedonprofile {

      public Boolean profileFlag{get;set;}
    
    public  vfHidebasedonprofile(){
        profileFlag = true;
        Id userid = UserInfo.getUserId();
        User userObj = [SELECT Id,Profile.Name FROM User WHERE Id =: userid limit 1];
        System.debug('profile name--->'+userObj.Profile.Name);
        // if(userObj.Profile.Name == 'Interviewer')//System Administrator
        if(userObj.Profile.Name == 'Interviewer')  
            profileFlag = false;  
    } 
    
}