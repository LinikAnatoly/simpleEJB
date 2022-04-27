
unit EditFINWorker;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINWorkerController ;

type
  TfrmFINWorkerEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblTabNumber : TLabel;
    edtTabNumber: TEdit;
    lblPositionName : TLabel;
    edtPositionName: TEdit;
    lblPositionCode : TLabel;
    edtPositionCode: TEdit;
    lblDepartmentName : TLabel;
    edtDepartmentName: TEdit;
    lblDepartmentCode : TLabel;
    edtDepartmentCode: TEdit;
    lblPriceGen : TLabel;
    edtPriceGen: TEdit;
    lblCategor : TLabel;
    edtCategor: TEdit;
    lblFinCode : TLabel;
    edtFinCode: TEdit;


  HTTPRIOFINWorker: THTTPRIO;

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
  frmFINWorkerEdit: TfrmFINWorkerEdit;
  FINWorkerObj: FINWorker;

implementation


{uses  
    EnergyproController, EnergyproController2, FINWorkerController  ;
}
{$R *.dfm}



procedure TfrmFINWorkerEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtTabNumber
      ,edtPositionName
      ,edtPositionCode
      ,edtDepartmentName
      ,edtDepartmentCode
      ,edtPriceGen
      ,edtCategor
      ,edtFinCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := FINWorkerObj.name; 
    if ( FINWorkerObj.tabNumber <> '' ) then
       edtTabNumber.Text := FINWorkerObj.tabNumber
    else
       edtTabNumber.Text := '';

    edtPositionName.Text := FINWorkerObj.positionName; 
    if ( FINWorkerObj.positionCode <> Low(Integer) ) then
       edtPositionCode.Text := IntToStr(FINWorkerObj.positionCode)
    else
       edtPositionCode.Text := '';
    edtDepartmentName.Text := FINWorkerObj.departmentName; 
    edtDepartmentCode.Text := FINWorkerObj.departmentCode; 
    if ( FINWorkerObj.priceGen <> nil ) then
       edtPriceGen.Text := FINWorkerObj.priceGen.decimalString
    else
       edtPriceGen.Text := ''; 
    if ( FINWorkerObj.categor <> Low(Integer) ) then
       edtCategor.Text := IntToStr(FINWorkerObj.categor)
    else
       edtCategor.Text := '';
    if ( FINWorkerObj.finCode <> Low(Integer) ) then
       edtFinCode.Text := IntToStr(FINWorkerObj.finCode)
    else
       edtFinCode.Text := '';


  end;
end;



procedure TfrmFINWorkerEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINWorker: FINWorkerControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtTabNumber
      ,edtPositionName
      ,edtPositionCode
      ,edtDepartmentName
      ,edtDepartmentCode
      ,edtPriceGen
      ,edtCategor
      ,edtFinCode
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempFINWorker := HTTPRIOFINWorker as FINWorkerControllerSoapPort;


     FINWorkerObj.name := edtName.Text; 

     if ( edtTabNumber.Text <> '' ) then
       FINWorkerObj.tabNumber := edtTabNumber.Text
     else
       FINWorkerObj.tabNumber := '' ;

     FINWorkerObj.positionName := edtPositionName.Text; 

     if ( edtPositionCode.Text <> '' ) then
       FINWorkerObj.positionCode := StrToInt(edtPositionCode.Text)
     else
       FINWorkerObj.positionCode := Low(Integer) ;

     FINWorkerObj.departmentName := edtDepartmentName.Text; 

     FINWorkerObj.departmentCode := edtDepartmentCode.Text; 

     if (FINWorkerObj.priceGen = nil ) then
       FINWorkerObj.priceGen := TXSDecimal.Create;
     if edtPriceGen.Text <> '' then
       FINWorkerObj.priceGen.decimalString := edtPriceGen.Text 
     else
       FINWorkerObj.priceGen := nil;

     if ( edtCategor.Text <> '' ) then
       FINWorkerObj.categor := StrToInt(edtCategor.Text)
     else
       FINWorkerObj.categor := Low(Integer) ;

     if ( edtFinCode.Text <> '' ) then
       FINWorkerObj.finCode := StrToInt(edtFinCode.Text)
     else
       FINWorkerObj.finCode := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      FINWorkerObj.code:=low(Integer);
      TempFINWorker.add(FINWorkerObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempFINWorker.save(FINWorkerObj);
    end;
  end;
end;


end.