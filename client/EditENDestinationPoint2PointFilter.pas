
unit EditENDestinationPoint2PointFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDestinationPoint2PointController ;

type
  TfrmENDestinationPoint2PointFilterEdit = class(TDialogForm)

    lblDistance : TLabel;
    edtDistance: TEdit;



  HTTPRIOENDestinationPoint2Point: THTTPRIO;

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
  frmENDestinationPoint2PointFilterEdit: TfrmENDestinationPoint2PointFilterEdit;
  ENDestinationPoint2PointFilterObj: ENDestinationPoint2PointFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDestinationPoint2PointController  ;
}
{$R *.dfm}



procedure TfrmENDestinationPoint2PointFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENDestinationPoint2PointObj.distance <> nil ) then
       edtDistance.Text := ENDestinationPoint2PointObj.distance.decimalString
    else
       edtDistance.Text := ''; 


  end;

}

end;



procedure TfrmENDestinationPoint2PointFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDestinationPoint2Point: ENDestinationPoint2PointControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENDestinationPoint2PointFilterObj.distance = nil ) then
       ENDestinationPoint2PointFilterObj.distance := TXSDecimal.Create;
     if edtDistance.Text <> '' then
       ENDestinationPoint2PointFilterObj.distance.decimalString := edtDistance.Text 
     else
       ENDestinationPoint2PointFilterObj.distance := nil;





  end;
end;




end.