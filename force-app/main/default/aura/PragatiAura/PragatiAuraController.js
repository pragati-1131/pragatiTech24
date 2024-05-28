({
    getInput : function(component,event,helper){
        let fName=component.get("v.firstname");
        let lname=component.get("v.lastname");
        let dob=component.get("v.dateofbirth");
        let ageobj=component.get("v.age");
        let Gender=component.get("v.gender");
        let phoneno=component.get("v.mobileNumber");
        let grad=component.get("v.graduated");
        let action=component.get("c.studentUsingAura");
        action.setParams(
        {
        "firstName":fName,
        "lastName":lname,
        "age":ageobj,
        "dateofbirth":dob,
        "mobileno":phoneno,
        "gender":Gender,
        "graduated":grad
    });
        action.setCallback(this,function(response){
            let state=response.getReturnValue();
            if(state=="success"){
                let toastEvent=$A.get("e.force:showToast");
                toastEvent.setParams({
                    "title":"Success",
                    "message":"Record Inserted",
                    "type":"success"
                });
                toastEvent.fire();
            }
            else{
                let toastEvent=$A.get("e.force:showToast");
                toastEvent.setParams({
                    "title":"error",
                    "message":state,
                    "type":"error"
                });
                toastEvent.fire();
            }
        });
            $A.enqueueAction(action);
        }
     
})
