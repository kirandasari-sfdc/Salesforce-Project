public class outputPanelCont {
    
    public Boolean render1{get;set;}
    public Boolean render2{get;set;}
    
    public outputPanelCont(ApexPages.StandardController controller) {
        render1 = true;
        render2 = false;
    }
    
    public outputPanelCont(){
        render1 = true;
        render2 = false;
    }
    
    
    public void hide1Show2(){
        render1=false;
        render2=true;
        
    }
    
    public void hide2Show1(){
        render1=true;
        render2=false;
    }
    
}