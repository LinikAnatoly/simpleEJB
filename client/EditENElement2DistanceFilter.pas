
unit EditENElement2DistanceFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENElement2DistanceController ;

type
  TfrmENElement2DistanceFilterEdit = class(TDialogForm)

    lblDistance : TLabel;
    edtDistance: TEdit;



  HTTPRIOENElement2Distance: THTTPRIO;

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
  frmENElement2DistanceFilterEdit: TfrmENElement2DistanceFilterEdit;
  ENElement2DistanceFilterObj: ENElement2DistanceFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENElement2DistanceController  ;
}
{$R *.dfm}



procedure TfrmENElement2DistanceFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENElement2DistanceObj.distance <> nil ) then
       edtDistance.Text := ENElement2DistanceObj.distance.decimalString
    else
       edtDistance.Text := ''; 


  end;

}

end;



procedure TfrmENElement2DistanceFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENElement2Distance: ENElement2DistanceControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENElement2DistanceFilterObj.distance = nil ) then
       ENElement2DistanceFilterObj.distance := TXSDecimal.Create;
     if edtDistance.Text <> '' then
       ENElement2DistanceFilterObj.distance.decimalString := edtDistance.Text 
     else
       ENElement2DistanceFilterObj.distance := nil;





  end;
end;




end.