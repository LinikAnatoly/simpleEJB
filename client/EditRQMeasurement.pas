
unit EditRQMeasurement;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQMeasurementController ;

type
  TfrmRQMeasurementEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblShortName : TLabel;
    edtShortName: TEdit;
    lblOutCode : TLabel;
    edtOutCode: TEdit;


  HTTPRIORQMeasurement: THTTPRIO;

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
  frmRQMeasurementEdit: TfrmRQMeasurementEdit;
  RQMeasurementObj: RQMeasurement;

implementation


{uses  
    EnergyproController, EnergyproController2, RQMeasurementController  ;
}
{$R *.dfm}



procedure TfrmRQMeasurementEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtShortName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := RQMeasurementObj.name; 
    edtShortName.Text := RQMeasurementObj.shortName; 
    if ( RQMeasurementObj.outCode <> Low(Integer) ) then
       edtOutCode.Text := IntToStr(RQMeasurementObj.outCode)
    else
       edtOutCode.Text := '';


  end;
end;



procedure TfrmRQMeasurementEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQMeasurement: RQMeasurementControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtShortName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQMeasurement := HTTPRIORQMeasurement as RQMeasurementControllerSoapPort;


     RQMeasurementObj.name := edtName.Text; 

     RQMeasurementObj.shortName := edtShortName.Text; 

     if ( edtOutCode.Text <> '' ) then
       RQMeasurementObj.outCode := StrToInt(edtOutCode.Text)
     else
       RQMeasurementObj.outCode := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      RQMeasurementObj.code:=low(Integer);
      TempRQMeasurement.add(RQMeasurementObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQMeasurement.save(RQMeasurementObj);
    end;
  end;
end;


end.