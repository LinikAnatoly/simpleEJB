
unit EditENSITFeature;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSITFeatureController ;

type
  TfrmENSITFeatureEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblValue : TLabel;
    edtValue: TEdit;

  lblENSITEquipmentEquipmentName : TLabel;
  edtENSITEquipmentEquipmentName : TEdit;
  spbENSITEquipmentEquipment : TSpeedButton;
  
  lblENSITFeatureTypeFeatureTypeName : TLabel;
  edtENSITFeatureTypeFeatureTypeName : TEdit;
  spbENSITFeatureTypeFeatureType : TSpeedButton;
  

  

  HTTPRIOENSITFeature: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENSITEquipmentEquipmentClick(Sender : TObject);
  procedure spbENSITFeatureTypeFeatureTypeClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSITFeatureEdit: TfrmENSITFeatureEdit;
  ENSITFeatureObj: ENSITFeature;

implementation

uses
  ShowENSITEquipment
  ,ENSITEquipmentController
  ,ShowENSITFeatureType
  ,ENSITFeatureTypeController

;

{uses  
    EnergyproController, EnergyproController2, ENSITFeatureController  ;
}
{$R *.dfm}



procedure TfrmENSITFeatureEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtValue
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENSITFeatureObj.name; 
    edtValue.Text := ENSITFeatureObj.value; 

    edtENSITEquipmentEquipmentName.Text := ENSITFeatureObj.equipment.name;
    edtENSITFeatureTypeFeatureTypeName.Text := ENSITFeatureObj.featureType.name;
    edtENSITEquipmentEquipmentName.Text := ENSITFeatureObj.equipment.name;
    edtENSITFeatureTypeFeatureTypeName.Text := ENSITFeatureObj.featureType.name;

  end;
end;



procedure TfrmENSITFeatureEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSITFeature: ENSITFeatureControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtValue
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSITFeature := HTTPRIOENSITFeature as ENSITFeatureControllerSoapPort;


     ENSITFeatureObj.name := edtName.Text; 

     ENSITFeatureObj.value := edtValue.Text; 

    if DialogState = dsInsert then
    begin
      ENSITFeatureObj.code:=low(Integer);
      TempENSITFeature.add(ENSITFeatureObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSITFeature.save(ENSITFeatureObj);
    end;
  end;
end;


procedure TfrmENSITFeatureEdit.spbENSITEquipmentEquipmentClick(Sender : TObject);
var 
   frmENSITEquipmentShow: TfrmENSITEquipmentShow;
begin
   frmENSITEquipmentShow:=TfrmENSITEquipmentShow.Create(Application,fmNormal);
   try
      with frmENSITEquipmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSITFeatureObj.equipment = nil then ENSITFeatureObj.equipment := ENSITEquipment.Create();
               ENSITFeatureObj.equipment.code := StrToInt(GetReturnValue(sgENSITEquipment,0));
               edtENSITEquipmentEquipmentName.Text:=GetReturnValue(sgENSITEquipment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENSITEquipmentShow.Free;
   end;
end;



procedure TfrmENSITFeatureEdit.spbENSITFeatureTypeFeatureTypeClick(Sender : TObject);
var 
   frmENSITFeatureTypeShow: TfrmENSITFeatureTypeShow;
begin
   frmENSITFeatureTypeShow:=TfrmENSITFeatureTypeShow.Create(Application,fmNormal);
   try
      with frmENSITFeatureTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSITFeatureObj.featureType = nil then ENSITFeatureObj.featureType := ENSITFeatureType.Create();
               ENSITFeatureObj.featureType.code := StrToInt(GetReturnValue(sgENSITFeatureType,0));
               edtENSITFeatureTypeFeatureTypeName.Text:=GetReturnValue(sgENSITFeatureType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENSITFeatureTypeShow.Free;
   end;
end;





end.