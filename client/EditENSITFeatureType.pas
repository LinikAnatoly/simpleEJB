
unit EditENSITFeatureType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSITFeatureTypeController ;

type
  TfrmENSITFeatureTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblSorter : TLabel;
    edtSorter: TEdit;
    lblDesc : TLabel;
    edtDesc: TEdit;
    lblPo : TLabel;
    edtPo: TEdit;

  lblENSITEquipmentEquipmentName : TLabel;
  edtENSITEquipmentEquipmentName : TEdit;
  spbENSITEquipmentEquipment : TSpeedButton;
  

  HTTPRIOENSITFeatureType: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENSITEquipmentEquipmentClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSITFeatureTypeEdit: TfrmENSITFeatureTypeEdit;
  ENSITFeatureTypeObj: ENSITFeatureType;

implementation

uses
  ShowENSITEquipment
  ,ENSITEquipmentController
;

{uses  
    EnergyproController, EnergyproController2, ENSITFeatureTypeController  ;
}
{$R *.dfm}



procedure TfrmENSITFeatureTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtSorter
      ,edtDesc
      ,edtPo
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENSITFeatureTypeObj.name; 
    if ( ENSITFeatureTypeObj.sorter <> Low(Integer) ) then
       edtSorter.Text := IntToStr(ENSITFeatureTypeObj.sorter)
    else
       edtSorter.Text := '';
    edtDesc.Text := ENSITFeatureTypeObj.desc; 
    if ( ENSITFeatureTypeObj.po <> Low(Integer) ) then
       edtPo.Text := IntToStr(ENSITFeatureTypeObj.po)
    else
       edtPo.Text := '';

    edtENSITEquipmentEquipmentName.Text := ENSITFeatureTypeObj.equipment.name;

  end;
end;



procedure TfrmENSITFeatureTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSITFeatureType: ENSITFeatureTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtSorter
      ,edtDesc
      ,edtPo
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSITFeatureType := HTTPRIOENSITFeatureType as ENSITFeatureTypeControllerSoapPort;


     ENSITFeatureTypeObj.name := edtName.Text; 

     if ( edtSorter.Text <> '' ) then
       ENSITFeatureTypeObj.sorter := StrToInt(edtSorter.Text)
     else
       ENSITFeatureTypeObj.sorter := Low(Integer) ;

     ENSITFeatureTypeObj.desc := edtDesc.Text; 

     if ( edtPo.Text <> '' ) then
       ENSITFeatureTypeObj.po := StrToInt(edtPo.Text)
     else
       ENSITFeatureTypeObj.po := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      ENSITFeatureTypeObj.code:=low(Integer);
      TempENSITFeatureType.add(ENSITFeatureTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSITFeatureType.save(ENSITFeatureTypeObj);
    end;
  end;
end;


procedure TfrmENSITFeatureTypeEdit.spbENSITEquipmentEquipmentClick(Sender : TObject);
var 
   frmENSITEquipmentShow: TfrmENSITEquipmentShow;
begin
   frmENSITEquipmentShow:=TfrmENSITEquipmentShow.Create(Application,fmNormal);
   try
      with frmENSITEquipmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSITFeatureTypeObj.equipment = nil then ENSITFeatureTypeObj.equipment := ENSITEquipment.Create();
               ENSITFeatureTypeObj.equipment.code := StrToInt(GetReturnValue(sgENSITEquipment,0));
               edtENSITEquipmentEquipmentName.Text:=GetReturnValue(sgENSITEquipment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENSITEquipmentShow.Free;
   end;
end;



end.