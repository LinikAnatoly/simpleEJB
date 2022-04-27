
unit EditENMeasurDeviceFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMeasurDeviceController ;

type
  TfrmENMeasurDeviceFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblWorkNumber : TLabel;
    edtWorkNumber: TEdit;


  lblENScaleScaleName : TLabel;
  edtENScaleScaleName : TEdit;
  spbENScaleScale : TSpeedButton;
    edtENBranchName: TEdit;
  spbENBrancheBranche : TSpeedButton;
  
  lblENHighVoltageSellHighvoltageSellName : TLabel;
  edtENHighVoltageSellHighvoltageSellName : TEdit;
  spbENHighVoltageSellHighvoltageSell : TSpeedButton;
  

  HTTPRIOENMeasurDevice: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblENBrancheName: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENScaleScaleClick(Sender : TObject);
  procedure spbENBrancheBrancheClick(Sender : TObject);
  procedure spbENHighVoltageSellHighvoltageSellClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENMeasurDeviceFilterEdit: TfrmENMeasurDeviceFilterEdit;
  ENMeasurDeviceFilterObj: ENMeasurDeviceFilter;

implementation

uses
  ShowENScale
  ,ENScaleController
  ,ShowENBranch
  ,ENBranchController
  ,ShowENHighVoltageSell
  ,ENHighVoltageSellController
;

{uses  
    EnergyproController, EnergyproController2, ENMeasurDeviceController  ;
}
{$R *.dfm}



procedure TfrmENMeasurDeviceFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENMeasurDeviceObj.name; 



    edtWorkNumber.Text := ENMeasurDeviceObj.workNumber; 


  end;

}

end;



procedure TfrmENMeasurDeviceFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENMeasurDeviceFilterObj.name := edtName.Text; 



     ENMeasurDeviceFilterObj.workNumber := edtWorkNumber.Text; 




  end;
end;

procedure TfrmENMeasurDeviceFilterEdit.spbENScaleScaleClick(Sender : TObject);
var 
   frmENScaleShow: TfrmENScaleShow;
begin
   frmENScaleShow:=TfrmENScaleShow.Create(Application,fmNormal);
   try
      with frmENScaleShow do
        if ShowModal = mrOk then
        begin
            try
               if ENMeasurDeviceFilterObj.scale = nil then ENMeasurDeviceFilterObj.scale := ENScale.Create();
               ENMeasurDeviceFilterObj.scale.code := StrToInt(GetReturnValue(sgENScale,0));
               edtENScaleScaleName.Text:=GetReturnValue(sgENScale,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENScaleShow.Free;
   end;
end;


procedure TfrmENMeasurDeviceFilterEdit.spbENBrancheBrancheClick(Sender : TObject);
var
   frmENBranchShow: TfrmENBranchShow;
begin
   frmENBranchShow:=TfrmENBranchShow.Create(Application,fmNormal);
   try
      with frmENBranchShow do
        if ShowModal = mrOk then
        begin
            try
               if ENMeasurDeviceFilterObj.branch = nil then ENMeasurDeviceFilterObj.branch := ENBranch.Create();
               ENMeasurDeviceFilterObj.branch.code := StrToInt(GetReturnValue(sgENBranch,0));
               edtENBranchName.Text:=GetReturnValue(sgENBranch,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENBranchShow.Free;
   end;
end;


procedure TfrmENMeasurDeviceFilterEdit.spbENHighVoltageSellHighvoltageSellClick(Sender : TObject);
var 
   frmENHighVoltageSellShow: TfrmENHighVoltageSellShow;
begin
   frmENHighVoltageSellShow:=TfrmENHighVoltageSellShow.Create(Application,fmNormal);
   try
      with frmENHighVoltageSellShow do
        if ShowModal = mrOk then
        begin
            try
               if ENMeasurDeviceFilterObj.highvoltageSell = nil then ENMeasurDeviceFilterObj.highvoltageSell := ENHighVoltageSell.Create();
               ENMeasurDeviceFilterObj.highvoltageSell.code := StrToInt(GetReturnValue(sgENHighVoltageSell,0));
               edtENHighVoltageSellHighvoltageSellName.Text:=GetReturnValue(sgENHighVoltageSell,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENHighVoltageSellShow.Free;
   end;
end;





end.