
unit EditRQMaterials2TKMaterials;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQMaterials2TKMaterialsController ;

type
  TfrmRQMaterials2TKMaterialsEdit = class(TDialogForm)

    lblCoef : TLabel;
    edtCoef: TEdit;

  lblRQMeasurementRqMeasurementName : TLabel;
  edtRQMeasurementRqMeasurementName : TEdit;
  spbRQMeasurementRqMeasurement : TSpeedButton;
  
  lblRQMaterialsRqMaterialsName : TLabel;
  edtRQMaterialsRqMaterialsName : TEdit;
  spbRQMaterialsRqMaterials : TSpeedButton;
  
  lblTKMeasurementTkMeasurementName : TLabel;
  edtTKMeasurementTkMeasurementName : TEdit;
  spbTKMeasurementTkMeasurement : TSpeedButton;
  
  lblTKMaterialsTkMaterialsName : TLabel;
  edtTKMaterialsTkMaterialsName : TEdit;
  spbTKMaterialsTkMaterials : TSpeedButton;
  

  HTTPRIORQMaterials2TKMaterials: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    HTTPRIORQMeasurement: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbRQMeasurementRqMeasurementClick(Sender : TObject);
  procedure spbRQMaterialsRqMaterialsClick(Sender : TObject);
  procedure spbTKMeasurementTkMeasurementClick(Sender : TObject);
  procedure spbTKMaterialsTkMaterialsClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQMaterials2TKMaterialsEdit: TfrmRQMaterials2TKMaterialsEdit;
  RQMaterials2TKMaterialsObj: RQMaterials2TKMaterials;

implementation

uses
  ShowRQMeasurement
  ,RQMeasurementController
  ,ShowRQMaterials
  ,RQMaterialsController
  ,ShowTKMeasurement
  ,TKMeasurementController
  ,ShowTKMaterials
  ,TKMaterialsController
;

{uses  
    EnergyproController, EnergyproController2, RQMaterials2TKMaterialsController  ;
}
{$R *.dfm}



procedure TfrmRQMaterials2TKMaterialsEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCoef
     ]);
   end;

  //if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ( RQMaterials2TKMaterialsObj.coef <> nil ) then
       edtCoef.Text := RQMaterials2TKMaterialsObj.coef.decimalString
    else
       edtCoef.Text := ''; 

    edtRQMeasurementRqMeasurementName.Text := RQMaterials2TKMaterialsObj.rqMeasurement.name;
    edtRQMaterialsRqMaterialsName.Text := RQMaterials2TKMaterialsObj.rqMaterials.name;
    edtTKMeasurementTkMeasurementName.Text := RQMaterials2TKMaterialsObj.tkMeasurement.name;
    edtTKMaterialsTkMaterialsName.Text := RQMaterials2TKMaterialsObj.tkMaterials.name;

  end;
end;



procedure TfrmRQMaterials2TKMaterialsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQMaterials2TKMaterials: RQMaterials2TKMaterialsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCoef
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQMaterials2TKMaterials := HTTPRIORQMaterials2TKMaterials as RQMaterials2TKMaterialsControllerSoapPort;


     if (RQMaterials2TKMaterialsObj.coef = nil ) then
       RQMaterials2TKMaterialsObj.coef := TXSDecimal.Create;
     if edtCoef.Text <> '' then
       RQMaterials2TKMaterialsObj.coef.decimalString := edtCoef.Text 
     else
       RQMaterials2TKMaterialsObj.coef := nil;

    if DialogState = dsInsert then
    begin
      RQMaterials2TKMaterialsObj.code:=low(Integer);
      TempRQMaterials2TKMaterials.add(RQMaterials2TKMaterialsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQMaterials2TKMaterials.save(RQMaterials2TKMaterialsObj);
    end;
  end;
end;


procedure TfrmRQMaterials2TKMaterialsEdit.spbRQMeasurementRqMeasurementClick(Sender : TObject);
var 
   frmRQMeasurementShow: TfrmRQMeasurementShow;
begin
   frmRQMeasurementShow:=TfrmRQMeasurementShow.Create(Application,fmNormal);
   try
      with frmRQMeasurementShow do
        if ShowModal = mrOk then
        begin
            try
               if RQMaterials2TKMaterialsObj.rqMeasurement = nil then RQMaterials2TKMaterialsObj.rqMeasurement := RQMeasurement.Create();
               RQMaterials2TKMaterialsObj.rqMeasurement.code := StrToInt(GetReturnValue(sgRQMeasurement,0));
               edtRQMeasurementRqMeasurementName.Text:=GetReturnValue(sgRQMeasurement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQMeasurementShow.Free;
   end;
end;



procedure TfrmRQMaterials2TKMaterialsEdit.spbRQMaterialsRqMaterialsClick(Sender : TObject);
var
   frmRQMaterialsShow: TfrmRQMaterialsShow;
   TempRQMaterials: RQMaterialsControllerSoapPort;
   tmpRQMat : RQMaterials;
begin
   frmRQMaterialsShow:=TfrmRQMaterialsShow.Create(Application,fmNormal);
   try
      with frmRQMaterialsShow do
        if ShowModal = mrOk then
        begin
            try
               if RQMaterials2TKMaterialsObj.rqMaterials = nil then RQMaterials2TKMaterialsObj.rqMaterials := RQMaterials.Create();
               RQMaterials2TKMaterialsObj.rqMaterials.code := StrToInt(GetReturnValue(sgRQMaterials,0));
               edtRQMaterialsRqMaterialsName.Text:=GetReturnValue(sgRQMaterials,2);
               TempRQMaterials := HTTPRIORQMaterials as RQMaterialsControllerSoapPort;
               tmpRQMat :=  TempRQMaterials.getObject(RQMaterials2TKMaterialsObj.rqMaterials.code);
               // вытянем ед. измерения ...
               if RQMaterials2TKMaterialsObj.rqMeasurement = nil then RQMaterials2TKMaterialsObj.rqMeasurement := RQMeasurement.Create;

               //TempRQMeasurement :=  HTTPRIORQMeasurement as RQMeasurementControllerSoapPort;
               //
               RQMaterials2TKMaterialsObj.rqMeasurement.code := tmpRQMat.measurement.code;
               RQMaterials2TKMaterialsObj.rqMeasurement.name := tmpRQMat.measurement.name;
               edtRQMeasurementRqMeasurementName.Text := RQMaterials2TKMaterialsObj.rqMeasurement.name;

               DisableControls([spbRQMeasurementRqMeasurement]);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQMaterialsShow.Free;
   end;
end;



procedure TfrmRQMaterials2TKMaterialsEdit.spbTKMeasurementTkMeasurementClick(Sender : TObject);
var 
   frmTKMeasurementShow: TfrmTKMeasurementShow;
begin
   frmTKMeasurementShow:=TfrmTKMeasurementShow.Create(Application,fmNormal);
   try
      with frmTKMeasurementShow do
        if ShowModal = mrOk then
        begin
            try
               if RQMaterials2TKMaterialsObj.tkMeasurement = nil then RQMaterials2TKMaterialsObj.tkMeasurement := TKMeasurement.Create();
               RQMaterials2TKMaterialsObj.tkMeasurement.code := StrToInt(GetReturnValue(sgTKMeasurement,0));
               edtTKMeasurementTkMeasurementName.Text:=GetReturnValue(sgTKMeasurement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMeasurementShow.Free;
   end;
end;



procedure TfrmRQMaterials2TKMaterialsEdit.spbTKMaterialsTkMaterialsClick(Sender : TObject);
var 
   frmTKMaterialsShow: TfrmTKMaterialsShow;
begin
   frmTKMaterialsShow:=TfrmTKMaterialsShow.Create(Application,fmNormal);
   try
      with frmTKMaterialsShow do
        if ShowModal = mrOk then
        begin
            try
               if RQMaterials2TKMaterialsObj.tkMaterials = nil then RQMaterials2TKMaterialsObj.tkMaterials := TKMaterials.Create();
               //RQMaterials2TKMaterialsObj.tkMaterials.code := StrToInt(GetReturnValue(sgTKMaterials,0));
               //edtTKMaterialsTkMaterialsName.Text:=GetReturnValue(sgTKMaterials,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMaterialsShow.Free;
   end;
end;



end.