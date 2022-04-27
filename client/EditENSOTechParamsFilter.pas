
unit EditENSOTechParamsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSOTechParamsController ;

type
  TfrmENSOTechParamsFilterEdit = class(TDialogForm)

    lblClosestDistance : TLabel;
    edtClosestDistance: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;



  HTTPRIOENSOTechParams: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSOTechParamsFilterEdit: TfrmENSOTechParamsFilterEdit;
  ENSOTechParamsFilterObj: ENSOTechParamsFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSOTechParamsController  ;
}
{$R *.dfm}



procedure TfrmENSOTechParamsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtClosestDistance
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENSOTechParamsObj.closestDistance <> Low(Integer) ) then
       edtClosestDistance.Text := IntToStr(ENSOTechParamsObj.closestDistance)
    else
       edtClosestDistance.Text := '';



    edtUserGen.Text := ENSOTechParamsObj.userGen; 


  end;

}

end;



procedure TfrmENSOTechParamsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSOTechParams: ENSOTechParamsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtClosestDistance.Text <> '' ) then
       ENSOTechParamsFilterObj.closestDistance := StrToInt(edtClosestDistance.Text)
     else
       ENSOTechParamsFilterObj.closestDistance := Low(Integer) ;
	   



     ENSOTechParamsFilterObj.userGen := edtUserGen.Text; 




  end;
end;




end.