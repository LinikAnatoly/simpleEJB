
unit EditRQMaterialsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQMaterialsController ;

type
  TfrmRQMaterialsFilterEdit = class(TDialogForm)

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
  frmRQMaterialsFilterEdit: TfrmRQMaterialsFilterEdit;
  RQMaterialsFilterObj: RQMaterialsFilter;

implementation

uses
  ShowRQMeasurement
  ,RQMeasurementController
;

{uses  
    EnergyproController, EnergyproController2, RQMaterialsController  ;
}
{$R *.dfm}



procedure TfrmRQMaterialsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

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


  end;

}

end;



procedure TfrmRQMaterialsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQMaterials: RQMaterialsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtOutCode.Text <> '' ) then
       RQMaterialsFilterObj.outCode := StrToInt(edtOutCode.Text)
     else
       RQMaterialsFilterObj.outCode := Low(Integer) ;




     RQMaterialsFilterObj.name := edtName.Text; 



     RQMaterialsFilterObj.shortName := edtShortName.Text; 



     if edtdateCreate.checked then
     begin 
       if RQMaterialsFilterObj.dateCreate = nil then
          RQMaterialsFilterObj.dateCreate := TXSDate.Create;
       RQMaterialsFilterObj.dateCreate.XSToNative(GetXSDate(edtdateCreate.DateTime));
     end
     else
       RQMaterialsFilterObj.dateCreate := nil;

     if edtdateDelete.checked then
     begin 
       if RQMaterialsFilterObj.dateDelete = nil then
          RQMaterialsFilterObj.dateDelete := TXSDate.Create;
       RQMaterialsFilterObj.dateDelete.XSToNative(GetXSDate(edtdateDelete.DateTime));
     end
     else
       RQMaterialsFilterObj.dateDelete := nil;






  end;
end;

procedure TfrmRQMaterialsFilterEdit.spbRQMeasurementMeasurementClick(Sender : TObject);
var 
   frmRQMeasurementShow: TfrmRQMeasurementShow;
begin
   frmRQMeasurementShow:=TfrmRQMeasurementShow.Create(Application,fmNormal);
   try
      with frmRQMeasurementShow do
        if ShowModal = mrOk then
        begin
            try
               if RQMaterialsFilterObj.measurement = nil then RQMaterialsFilterObj.measurement := RQMeasurement.Create();
               RQMaterialsFilterObj.measurement.code := StrToInt(GetReturnValue(sgRQMeasurement,0));
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