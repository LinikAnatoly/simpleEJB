
unit EditENDistance;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDistanceController ;

type
  TfrmENDistanceEdit = class(TDialogForm)

    lblDistance : TLabel;
    edtDistance: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

  lblENRoadTypeRoadTypeName : TLabel;
  edtENRoadTypeRoadTypeName : TEdit;
  spbENRoadTypeRoadType : TSpeedButton;
  

  HTTPRIOENDistance: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    cbDistanceType: TComboBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENRoadTypeRoadTypeClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENDistanceEdit: TfrmENDistanceEdit;
  ENDistanceObj: ENDistance;

implementation

uses
  ShowENRoadType
  ,ENRoadTypeController
, ENDistanceTypeController;

{uses  
    EnergyproController, EnergyproController2, ENDistanceController  ;
}
{$R *.dfm}



procedure TfrmENDistanceEdit.FormShow(Sender: TObject);

begin

  SetFloatStyle([edtDistance]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtENRoadTypeRoadTypeName]);
    DenyBlankValues([
      edtDistance
      ,edtENRoadTypeRoadTypeName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ( ENDistanceObj.distance <> nil ) then
       edtDistance.Text := ENDistanceObj.distance.decimalString
    else
       edtDistance.Text := '';
    edtCommentGen.Text := ENDistanceObj.commentGen;

    edtENRoadTypeRoadTypeName.Text := ENDistanceObj.roadType.name;

    if ENDistanceObj.typeRef <> nil then
      if ENDistanceObj.typeRef.code <> Low(Integer) then
        cbDistanceType.ItemIndex := ENDistanceObj.typeRef.code - 1;
  end;

  if DialogState = dsInsert then
  begin
    if ENDistanceObj.roadType = nil then ENDistanceObj.roadType := ENRoadType.Create;
    ENDistanceObj.roadType.code := 2 ; // грунтовая ..

    edtENRoadTypeRoadTypeName.Text := 'грунтовая';
  end;
end;



procedure TfrmENDistanceEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDistance: ENDistanceControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtDistance
      , edtENRoadTypeRoadTypeName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENDistance := HTTPRIOENDistance as ENDistanceControllerSoapPort;

     if (ENDistanceObj.distance = nil ) then
       ENDistanceObj.distance := TXSDecimal.Create;
     if edtDistance.Text <> '' then
       ENDistanceObj.distance.decimalString := edtDistance.Text 
     else
       ENDistanceObj.distance := nil;

     ENDistanceObj.commentGen := edtCommentGen.Text;

     if ENDistanceObj.typeRef = nil then ENDistanceObj.typeRef := ENDistanceTypeRef.Create;
     ENDistanceObj.typeRef.code := cbDistanceType.ItemIndex + 1;

    if DialogState = dsInsert then
    begin
      ENDistanceObj.code:=low(Integer);
      TempENDistance.add(ENDistanceObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDistance.save(ENDistanceObj);
    end;
  end;
end;


procedure TfrmENDistanceEdit.spbENRoadTypeRoadTypeClick(Sender : TObject);
var 
   frmENRoadTypeShow: TfrmENRoadTypeShow;
begin
   frmENRoadTypeShow:=TfrmENRoadTypeShow.Create(Application,fmNormal);
   try
      with frmENRoadTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENDistanceObj.roadType = nil then ENDistanceObj.roadType := ENRoadType.Create();
               ENDistanceObj.roadType.code := StrToInt(GetReturnValue(sgENRoadType,0));
               edtENRoadTypeRoadTypeName.Text:=GetReturnValue(sgENRoadType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENRoadTypeShow.Free;
   end;
end;



end.