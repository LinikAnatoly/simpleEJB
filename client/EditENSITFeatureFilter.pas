
unit EditENSITFeatureFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSITFeatureController ;

type
  TfrmENSITFeatureFilterEdit = class(TDialogForm)

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
  frmENSITFeatureFilterEdit: TfrmENSITFeatureFilterEdit;
  ENSITFeatureFilterObj: ENSITFeatureFilter;

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



procedure TfrmENSITFeatureFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

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


  end;

}

end;



procedure TfrmENSITFeatureFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSITFeature: ENSITFeatureControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSITFeatureFilterObj.name := edtName.Text; 



     ENSITFeatureFilterObj.value := edtValue.Text; 




  end;
end;

procedure TfrmENSITFeatureFilterEdit.spbENSITEquipmentEquipmentClick(Sender : TObject);
var 
   frmENSITEquipmentShow: TfrmENSITEquipmentShow;
begin
   frmENSITEquipmentShow:=TfrmENSITEquipmentShow.Create(Application,fmNormal);
   try
      with frmENSITEquipmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSITFeatureFilterObj.equipment = nil then ENSITFeatureFilterObj.equipment := ENSITEquipment.Create();
               ENSITFeatureFilterObj.equipment.code := StrToInt(GetReturnValue(sgENSITEquipment,0));
               edtENSITEquipmentEquipmentName.Text:=GetReturnValue(sgENSITEquipment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENSITEquipmentShow.Free;
   end;
end;


procedure TfrmENSITFeatureFilterEdit.spbENSITFeatureTypeFeatureTypeClick(Sender : TObject);
var 
   frmENSITFeatureTypeShow: TfrmENSITFeatureTypeShow;
begin
   frmENSITFeatureTypeShow:=TfrmENSITFeatureTypeShow.Create(Application,fmNormal);
   try
      with frmENSITFeatureTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSITFeatureFilterObj.featureType = nil then ENSITFeatureFilterObj.featureType := ENSITFeatureType.Create();
               ENSITFeatureFilterObj.featureType.code := StrToInt(GetReturnValue(sgENSITFeatureType,0));
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