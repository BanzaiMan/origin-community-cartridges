/*
Script by RoBorg
RoBorg@geniusbug.com
http://javascript.geniusbug.com | http://www.roborg.co.uk
Please do not remove or edit this message
Please link to this website if you use this script!
*/
function getElementValue(formElement)
{
   if (formElement.length != null) var type = formElement[0].type;
   if ((typeof(type) == 'undefined') || (type == 0)) var type = formElement.type;
   switch (type)
   {
      case 'undefined':
         return null;
      case 'radio':
         for (var i = 0; i < formElement.length; i++)
         {
            if (formElement[i].checked)
               return formElement[i].value;
         }
         return null;
      case 'select-multiple':
         var values = new Array();
         for (var i = 0; i < formElement.length; i++)
         {
            if (formElement[i].selected)
               values[values.length] = formElement[i].value;            
         }
         return values;
      case 'checkbox':
         return formElement.checked;
      default:
         return formElement.value;
   }
}

function setElementValue(formElement, value)
{
   if (formElement.length != null)
       var type = formElement[0].type;
   if ((typeof(type) == 'undefined') || (type == 0))
       var type = formElement.type;
   switch (type)
   {
      case 'undefined':
         break;
      case 'checkbox':
         if (typeof value == 'boolean')
            formElement.checked = value;
         else
            formElement.value = value;
         break;
      case 'radio':
         for (var i = 0; i < formElement.length; i++)
         {
            if (formElement[i].value == value)
               formElement[i].checked = true;            
         }
         break;
      case 'select-one':
         formElement.selectedIndex = value; break;
      case 'select-multiple':
         for (var i = 0; i < formElement.length; i++)
         {
            formElement[i].selected = value[i];
         }
         break;
      default:
         formElement.value = value; break;
   }
}
