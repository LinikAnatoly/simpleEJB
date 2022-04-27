
unit EditENPowerReliabilityCategoryFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPowerReliabilityCategoryController ;

type
  TfrmENPowerReliabilityCategoryFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  lblENSettleTypeSettleTypeRefName : TLabel;
  edtENSettleTypeSettleTypeRefName : TEdit;
  spbENSettleTypeSettleTypeRef : TSpeedButton;
  

  HTTPRIOENPowerReliabilityCategory: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENSettleTypeSettleTypeRefClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPowerReliabilityCategoryFilterEdit: TfrmENPowerReliabilityCategoryFilterEdit;
  ENPowerReliabilityCategoryFilterObj: ENPowerReliabilityCategoryFilter;

implementation

uses
  ShowENSettleType
  ,ENSettleTypeController
;

{uses  
    EnergyproController, EnergyproController2, ENPowerReliabilityCategoryController  ;
}
{$R *.dfm}



procedure TfrmENPowerReliabilityCategoryFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENPowerReliabilityCategoryObj.name; 


  end;

}

end;



procedure TfrmENPowerReliabilityCategoryFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPowerReliabilityCategory: ENPowerReliabilityCategoryControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPowerReliabilityCategoryFilterObj.name := edtName.Text; 




  end;
end;

procedure TfrmENPowerReliabilityCategoryFilterEdit.spbENSettleTypeSettleTypeRefClick(Sender : TObject);
var 
   frmENSettleTypeShow: TfrmENSettleTypeShow;
begin
   frmENSettleTypeShow:=TfrmENSettleTypeShow.Create(Application,fmNormal);
   try
      with frmENSettleTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPowerReliabilityCategoryFilterObj.settleTypeRef = nil then ENPowerReliabilityCategoryFilterObj.settleTypeRef := ENSettleTypeRef.Create();
               ENPowerReliabilityCategoryFilterObj.settleTypeRef.code := StrToInt(GetReturnValue(sgENSettleType,0));
               edtENSettleTypeSettleTypeRefName.Text:=GetReturnValue(sgENSettleType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENSettleTypeShow.Free;
   end;
end;





end.