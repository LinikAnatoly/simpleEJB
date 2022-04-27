
unit EditENSITFeatureTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSITFeatureTypeController ;

type
  TfrmENSITFeatureTypeFilterEdit = class(TDialogForm)

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
  frmENSITFeatureTypeFilterEdit: TfrmENSITFeatureTypeFilterEdit;
  ENSITFeatureTypeFilterObj: ENSITFeatureTypeFilter;

implementation

uses
  ShowENSITEquipment
  ,ENSITEquipmentController
;

{uses  
    EnergyproController, EnergyproController2, ENSITFeatureTypeController  ;
}
{$R *.dfm}



procedure TfrmENSITFeatureTypeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

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


  end;

}

end;



procedure TfrmENSITFeatureTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSITFeatureType: ENSITFeatureTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSITFeatureTypeFilterObj.name := edtName.Text; 



     if ( edtSorter.Text <> '' ) then
       ENSITFeatureTypeFilterObj.sorter := StrToInt(edtSorter.Text)
     else
       ENSITFeatureTypeFilterObj.sorter := Low(Integer) ;




     ENSITFeatureTypeFilterObj.desc := edtDesc.Text; 



     if ( edtPo.Text <> '' ) then
       ENSITFeatureTypeFilterObj.po := StrToInt(edtPo.Text)
     else
       ENSITFeatureTypeFilterObj.po := Low(Integer) ;





  end;
end;

procedure TfrmENSITFeatureTypeFilterEdit.spbENSITEquipmentEquipmentClick(Sender : TObject);
var 
   frmENSITEquipmentShow: TfrmENSITEquipmentShow;
begin
   frmENSITEquipmentShow:=TfrmENSITEquipmentShow.Create(Application,fmNormal);
   try
      with frmENSITEquipmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSITFeatureTypeFilterObj.equipment = nil then ENSITFeatureTypeFilterObj.equipment := ENSITEquipment.Create();
               ENSITFeatureTypeFilterObj.equipment.code := StrToInt(GetReturnValue(sgENSITEquipment,0));
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