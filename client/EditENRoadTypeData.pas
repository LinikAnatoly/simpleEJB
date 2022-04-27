
unit EditENRoadTypeData;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRoadTypeDataController ;

type
  TfrmENRoadTypeDataEdit = class(TDialogForm)

    lblSpeed : TLabel;
    edtSpeed: TEdit;
    lblDistance : TLabel;
    edtDistance: TEdit;
    lblIsWinter : TLabel;
    edtIsWinter: TEdit;
    lblCoeff : TLabel;
    edtCoeff: TEdit;


  HTTPRIOENRoadTypeData: THTTPRIO;

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
  frmENRoadTypeDataEdit: TfrmENRoadTypeDataEdit;
  ENRoadTypeDataObj: ENRoadTypeData;

implementation


{uses  
    EnergyproController, EnergyproController2, ENRoadTypeDataController  ;
}
{$R *.dfm}



procedure TfrmENRoadTypeDataEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtSpeed
      ,edtDistance
      ,edtIsWinter
      ,edtCoeff
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ( ENRoadTypeDataObj.speed <> nil ) then
       edtSpeed.Text := ENRoadTypeDataObj.speed.decimalString
    else
       edtSpeed.Text := ''; 
    if ( ENRoadTypeDataObj.distance <> nil ) then
       edtDistance.Text := ENRoadTypeDataObj.distance.decimalString
    else
       edtDistance.Text := ''; 
    if ( ENRoadTypeDataObj.isWinter <> Low(Integer) ) then
       edtIsWinter.Text := IntToStr(ENRoadTypeDataObj.isWinter)
    else
       edtIsWinter.Text := '';
    if ( ENRoadTypeDataObj.coeff <> nil ) then
       edtCoeff.Text := ENRoadTypeDataObj.coeff.decimalString
    else
       edtCoeff.Text := ''; 


  end;
end;



procedure TfrmENRoadTypeDataEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRoadTypeData: ENRoadTypeDataControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtSpeed
      ,edtDistance
      ,edtIsWinter
      ,edtCoeff
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENRoadTypeData := HTTPRIOENRoadTypeData as ENRoadTypeDataControllerSoapPort;


     if (ENRoadTypeDataObj.speed = nil ) then
       ENRoadTypeDataObj.speed := TXSDecimal.Create;
     if edtSpeed.Text <> '' then
       ENRoadTypeDataObj.speed.decimalString := edtSpeed.Text 
     else
       ENRoadTypeDataObj.speed := nil;

     if (ENRoadTypeDataObj.distance = nil ) then
       ENRoadTypeDataObj.distance := TXSDecimal.Create;
     if edtDistance.Text <> '' then
       ENRoadTypeDataObj.distance.decimalString := edtDistance.Text 
     else
       ENRoadTypeDataObj.distance := nil;

     if ( edtIsWinter.Text <> '' ) then
       ENRoadTypeDataObj.isWinter := StrToInt(edtIsWinter.Text)
     else
       ENRoadTypeDataObj.isWinter := Low(Integer) ;

     if (ENRoadTypeDataObj.coeff = nil ) then
       ENRoadTypeDataObj.coeff := TXSDecimal.Create;
     if edtCoeff.Text <> '' then
       ENRoadTypeDataObj.coeff.decimalString := edtCoeff.Text 
     else
       ENRoadTypeDataObj.coeff := nil;

    if DialogState = dsInsert then
    begin
      ENRoadTypeDataObj.code:=low(Integer);
      TempENRoadTypeData.add(ENRoadTypeDataObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENRoadTypeData.save(ENRoadTypeDataObj);
    end;
  end;
end;


end.