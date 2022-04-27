
unit EditRQMaterials2TKMaterialsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQMaterials2TKMaterialsController ;

type
  TfrmRQMaterials2TKMaterialsFilterEdit = class(TDialogForm)

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
  frmRQMaterials2TKMaterialsFilterEdit: TfrmRQMaterials2TKMaterialsFilterEdit;
  RQMaterials2TKMaterialsFilterObj: RQMaterials2TKMaterialsFilter;

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



procedure TfrmRQMaterials2TKMaterialsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCoef
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( RQMaterials2TKMaterialsObj.coef <> nil ) then
       edtCoef.Text := RQMaterials2TKMaterialsObj.coef.decimalString
    else
       edtCoef.Text := ''; 


  end;

}

end;



procedure TfrmRQMaterials2TKMaterialsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQMaterials2TKMaterials: RQMaterials2TKMaterialsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (RQMaterials2TKMaterialsFilterObj.coef = nil ) then
       RQMaterials2TKMaterialsFilterObj.coef := TXSDecimal.Create;
     RQMaterials2TKMaterialsFilterObj.coef.decimalString := edtCoef.Text ;




  end;
end;

procedure TfrmRQMaterials2TKMaterialsFilterEdit.spbRQMeasurementRqMeasurementClick(Sender : TObject);
var 
   frmRQMeasurementShow: TfrmRQMeasurementShow;
begin
   frmRQMeasurementShow:=TfrmRQMeasurementShow.Create(Application,fmNormal);
   try
      with frmRQMeasurementShow do
        if ShowModal = mrOk then
        begin
            try
               if RQMaterials2TKMaterialsFilterObj.rqMeasurement = nil then RQMaterials2TKMaterialsFilterObj.rqMeasurement := RQMeasurement.Create();
               RQMaterials2TKMaterialsFilterObj.rqMeasurement.code := StrToInt(GetReturnValue(sgRQMeasurement,0));
               edtRQMeasurementRqMeasurementName.Text:=GetReturnValue(sgRQMeasurement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQMeasurementShow.Free;
   end;
end;


procedure TfrmRQMaterials2TKMaterialsFilterEdit.spbRQMaterialsRqMaterialsClick(Sender : TObject);
var 
   frmRQMaterialsShow: TfrmRQMaterialsShow;
begin
   frmRQMaterialsShow:=TfrmRQMaterialsShow.Create(Application,fmNormal);
   try
      with frmRQMaterialsShow do
        if ShowModal = mrOk then
        begin
            try
               if RQMaterials2TKMaterialsFilterObj.rqMaterials = nil then RQMaterials2TKMaterialsFilterObj.rqMaterials := RQMaterials.Create();
               RQMaterials2TKMaterialsFilterObj.rqMaterials.code := StrToInt(GetReturnValue(sgRQMaterials,0));
               edtRQMaterialsRqMaterialsName.Text:=GetReturnValue(sgRQMaterials,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQMaterialsShow.Free;
   end;
end;


procedure TfrmRQMaterials2TKMaterialsFilterEdit.spbTKMeasurementTkMeasurementClick(Sender : TObject);
var 
   frmTKMeasurementShow: TfrmTKMeasurementShow;
begin
   frmTKMeasurementShow:=TfrmTKMeasurementShow.Create(Application,fmNormal);
   try
      with frmTKMeasurementShow do
        if ShowModal = mrOk then
        begin
            try
               if RQMaterials2TKMaterialsFilterObj.tkMeasurement = nil then RQMaterials2TKMaterialsFilterObj.tkMeasurement := TKMeasurement.Create();
               RQMaterials2TKMaterialsFilterObj.tkMeasurement.code := StrToInt(GetReturnValue(sgTKMeasurement,0));
               edtTKMeasurementTkMeasurementName.Text:=GetReturnValue(sgTKMeasurement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMeasurementShow.Free;
   end;
end;


procedure TfrmRQMaterials2TKMaterialsFilterEdit.spbTKMaterialsTkMaterialsClick(Sender : TObject);
var 
   frmTKMaterialsShow: TfrmTKMaterialsShow;
begin
   frmTKMaterialsShow:=TfrmTKMaterialsShow.Create(Application,fmNormal);
   try
      with frmTKMaterialsShow do
        if ShowModal = mrOk then
        begin
            try
               if RQMaterials2TKMaterialsFilterObj.tkMaterials = nil then RQMaterials2TKMaterialsFilterObj.tkMaterials := TKMaterials.Create();
               //RQMaterials2TKMaterialsFilterObj.tkMaterials.code := StrToInt(GetReturnValue(sgTKMaterials,0));
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