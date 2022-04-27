
unit EditENCoordinates;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCoordinatesController ;

type
  TfrmENCoordinatesEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblLatitude : TLabel;
    edtLatitude: TEdit;
    lblLongitude : TLabel;
    edtLongitude: TEdit;
    lblLatitude2 : TLabel;
    edtLatitude2: TEdit;
    lblLongitude2 : TLabel;
    edtLongitude2: TEdit;
    lblgeographicCode : TLabel;
    edtgeographicCode: TEdit;

  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENCoordinates: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENCoordinatesEdit: TfrmENCoordinatesEdit;
  ENCoordinatesObj: ENCoordinates;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENCoordinatesController  ;
}
{$R *.dfm}



procedure TfrmENCoordinatesEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENElementElementName
      ,spbENElementElement
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENCoordinatesObj.code);
    if ( ENCoordinatesObj.latitude <> nil ) then
       edtLatitude.Text := ENCoordinatesObj.latitude.decimalString
    else
       edtLatitude.Text := ''; 
    if ( ENCoordinatesObj.longitude <> nil ) then
       edtLongitude.Text := ENCoordinatesObj.longitude.decimalString
    else
       edtLongitude.Text := ''; 
    if ( ENCoordinatesObj.latitude2 <> nil ) then
       edtLatitude2.Text := ENCoordinatesObj.latitude2.decimalString
    else
       edtLatitude2.Text := ''; 
    if ( ENCoordinatesObj.longitude2 <> nil ) then
       edtLongitude2.Text := ENCoordinatesObj.longitude2.decimalString
    else
       edtLongitude2.Text := ''; 
    edtgeographicCode.Text := ENCoordinatesObj.geographicCode; 

    //edtENElementElementName.Text := ENCoordinatesObj.element.name;

  end;
end;



procedure TfrmENCoordinatesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCoordinates: ENCoordinatesControllerSoapPort;
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
    TempENCoordinates := HTTPRIOENCoordinates as ENCoordinatesControllerSoapPort;


     if (ENCoordinatesObj.latitude = nil ) then
       ENCoordinatesObj.latitude := TXSDecimal.Create;
     if edtLatitude.Text <> '' then
       ENCoordinatesObj.latitude.decimalString := edtLatitude.Text 
     else
       ENCoordinatesObj.latitude := nil;

     if (ENCoordinatesObj.longitude = nil ) then
       ENCoordinatesObj.longitude := TXSDecimal.Create;
     if edtLongitude.Text <> '' then
       ENCoordinatesObj.longitude.decimalString := edtLongitude.Text 
     else
       ENCoordinatesObj.longitude := nil;

     if (ENCoordinatesObj.latitude2 = nil ) then
       ENCoordinatesObj.latitude2 := TXSDecimal.Create;
     if edtLatitude2.Text <> '' then
       ENCoordinatesObj.latitude2.decimalString := edtLatitude2.Text 
     else
       ENCoordinatesObj.latitude2 := nil;

     if (ENCoordinatesObj.longitude2 = nil ) then
       ENCoordinatesObj.longitude2 := TXSDecimal.Create;
     if edtLongitude2.Text <> '' then
       ENCoordinatesObj.longitude2.decimalString := edtLongitude2.Text 
     else
       ENCoordinatesObj.longitude2 := nil;

     ENCoordinatesObj.geographicCode := edtgeographicCode.Text; 

    if DialogState = dsInsert then
    begin
      ENCoordinatesObj.code:=low(Integer);
      TempENCoordinates.add(ENCoordinatesObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENCoordinates.save(ENCoordinatesObj);
    end;
  end;
end;


procedure TfrmENCoordinatesEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENCoordinatesObj.element = nil then ENCoordinatesObj.element := ENElement.Create();
               ENCoordinatesObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



end.