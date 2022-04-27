
unit EditENDestinationPoint2Point;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDestinationPoint2PointController ;

type
  TfrmENDestinationPoint2PointEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
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
  frmENDestinationPoint2PointEdit: TfrmENDestinationPoint2PointEdit;
  ENDestinationPoint2PointObj: ENDestinationPoint2Point;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDestinationPoint2PointController  ;
}
{$R *.dfm}



procedure TfrmENDestinationPoint2PointEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENDestinationPoint2PointObj.code);
    if ( ENDestinationPoint2PointObj.distance <> nil ) then
       edtDistance.Text := ENDestinationPoint2PointObj.distance.decimalString
    else
       edtDistance.Text := ''; 


  end;
end;



procedure TfrmENDestinationPoint2PointEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDestinationPoint2Point: ENDestinationPoint2PointControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENDestinationPoint2Point := HTTPRIOENDestinationPoint2Point as ENDestinationPoint2PointControllerSoapPort;


     if (ENDestinationPoint2PointObj.distance = nil ) then
       ENDestinationPoint2PointObj.distance := TXSDecimal.Create;
     if edtDistance.Text <> '' then
       ENDestinationPoint2PointObj.distance.decimalString := edtDistance.Text 
     else
       ENDestinationPoint2PointObj.distance := nil;

    if DialogState = dsInsert then
    begin
      ENDestinationPoint2PointObj.code:=low(Integer);
      TempENDestinationPoint2Point.add(ENDestinationPoint2PointObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDestinationPoint2Point.save(ENDestinationPoint2PointObj);
    end;
  end;
end;


end.