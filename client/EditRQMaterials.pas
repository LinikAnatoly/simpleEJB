
unit EditRQMaterials;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQMaterialsController ;

type
  TfrmRQMaterialsEdit = class(TDialogForm)

    lblOutCode : TLabel;
    edtOutCode: TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblShortName : TLabel;
    edtShortName: TEdit;
    lblDateCreate : TLabel;
    edtDateCreate: TDateTimePicker;
    lblDateDelete : TLabel;
    edtDateDelete: TDateTimePicker;

  lblRQMeasurementMeasurementName : TLabel;
  edtRQMeasurementMeasurementName : TEdit;
  spbRQMeasurementMeasurement : TSpeedButton;
  

  HTTPRIORQMaterials: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbRQMeasurementMeasurementClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQMaterialsEdit: TfrmRQMaterialsEdit;
  RQMaterialsObj: RQMaterials;

implementation

uses
  ShowRQMeasurement
  ,RQMeasurementController
;

{uses  
    EnergyproController, EnergyproController2, RQMaterialsController  ;
}
{$R *.dfm}



procedure TfrmRQMaterialsEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ( RQMaterialsObj.outCode <> Low(Integer) ) then
       edtOutCode.Text := IntToStr(RQMaterialsObj.outCode)
    else
       edtOutCode.Text := '';
    edtName.Text := RQMaterialsObj.name; 
    edtShortName.Text := RQMaterialsObj.shortName; 
      if RQMaterialsObj.dateCreate <> nil then
      begin
        edtDateCreate.DateTime:=EncodeDate(RQMaterialsObj.dateCreate.Year,RQMaterialsObj.dateCreate.Month,RQMaterialsObj.dateCreate.Day);
        edtDateCreate.checked := true;
      end
      else
      begin
        edtDateCreate.DateTime:=SysUtils.Date;
        edtDateCreate.checked := false;
      end;
      if RQMaterialsObj.dateDelete <> nil then
      begin
        edtDateDelete.DateTime:=EncodeDate(RQMaterialsObj.dateDelete.Year,RQMaterialsObj.dateDelete.Month,RQMaterialsObj.dateDelete.Day);
        edtDateDelete.checked := true;
      end
      else
      begin
        edtDateDelete.DateTime:=SysUtils.Date;
        edtDateDelete.checked := false;
      end;

    edtRQMeasurementMeasurementName.Text := RQMaterialsObj.measurement.name;

  end;
end;



procedure TfrmRQMaterialsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQMaterials: RQMaterialsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQMaterials := HTTPRIORQMaterials as RQMaterialsControllerSoapPort;


     if ( edtOutCode.Text <> '' ) then
       RQMaterialsObj.outCode := StrToInt(edtOutCode.Text)
     else
       RQMaterialsObj.outCode := Low(Integer) ;

     RQMaterialsObj.name := edtName.Text; 

     RQMaterialsObj.shortName := edtShortName.Text; 

     if edtdateCreate.checked then
     begin 
       if RQMaterialsObj.dateCreate = nil then
          RQMaterialsObj.dateCreate := TXSDate.Create;
       RQMaterialsObj.dateCreate.XSToNative(GetXSDate(edtdateCreate.DateTime));
     end
     else
       RQMaterialsObj.dateCreate := nil;

     if edtdateDelete.checked then
     begin 
       if RQMaterialsObj.dateDelete = nil then
          RQMaterialsObj.dateDelete := TXSDate.Create;
       RQMaterialsObj.dateDelete.XSToNative(GetXSDate(edtdateDelete.DateTime));
     end
     else
       RQMaterialsObj.dateDelete := nil;

    if DialogState = dsInsert then
    begin
      RQMaterialsObj.code:=low(Integer);
      TempRQMaterials.add(RQMaterialsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQMaterials.save(RQMaterialsObj);
    end;
  end;
end;


procedure TfrmRQMaterialsEdit.spbRQMeasurementMeasurementClick(Sender : TObject);
var 
   frmRQMeasurementShow: TfrmRQMeasurementShow;
begin
   frmRQMeasurementShow:=TfrmRQMeasurementShow.Create(Application,fmNormal);
   try
      with frmRQMeasurementShow do
        if ShowModal = mrOk then
        begin
            try
               if RQMaterialsObj.measurement = nil then RQMaterialsObj.measurement := RQMeasurement.Create();
               RQMaterialsObj.measurement.code := StrToInt(GetReturnValue(sgRQMeasurement,0));
               edtRQMeasurementMeasurementName.Text:=GetReturnValue(sgRQMeasurement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQMeasurementShow.Free;
   end;
end;



end.