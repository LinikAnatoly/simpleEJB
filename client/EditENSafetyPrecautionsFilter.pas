
unit EditENSafetyPrecautionsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSafetyPrecautionsController ;

type
  TfrmENSafetyPrecautionsFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  lblENLockTypeLockTypeName : TLabel;
  edtENLockTypeLockTypeName : TEdit;
  spbENLockTypeLockType : TSpeedButton;
  
  lblENFencingFencingName : TLabel;
  edtENFencingFencingName : TEdit;
  spbENFencingFencing : TSpeedButton;
  

  HTTPRIOENSafetyPrecautions: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENLockTypeLockTypeClick(Sender : TObject);
  procedure spbENFencingFencingClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSafetyPrecautionsFilterEdit: TfrmENSafetyPrecautionsFilterEdit;
  ENSafetyPrecautionsFilterObj: ENSafetyPrecautionsFilter;

implementation

uses
  ShowENLockType
  ,ENLockTypeController
  ,ShowENFencing
  ,ENFencingController
;

{uses  
    EnergyproController, EnergyproController2, ENSafetyPrecautionsController  ;
}
{$R *.dfm}



procedure TfrmENSafetyPrecautionsFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSafetyPrecautionsObj.name; 


  end;

}

end;



procedure TfrmENSafetyPrecautionsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSafetyPrecautions: ENSafetyPrecautionsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSafetyPrecautionsFilterObj.name := edtName.Text; 




  end;
end;

procedure TfrmENSafetyPrecautionsFilterEdit.spbENLockTypeLockTypeClick(Sender : TObject);
var 
   frmENLockTypeShow: TfrmENLockTypeShow;
begin
   frmENLockTypeShow:=TfrmENLockTypeShow.Create(Application,fmNormal);
   try
      with frmENLockTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSafetyPrecautionsFilterObj.lockType = nil then ENSafetyPrecautionsFilterObj.lockType := ENLockType.Create();
               ENSafetyPrecautionsFilterObj.lockType.code := StrToInt(GetReturnValue(sgENLockType,0));
               edtENLockTypeLockTypeName.Text:=GetReturnValue(sgENLockType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENLockTypeShow.Free;
   end;
end;


procedure TfrmENSafetyPrecautionsFilterEdit.spbENFencingFencingClick(Sender : TObject);
var 
   frmENFencingShow: TfrmENFencingShow;
begin
   frmENFencingShow:=TfrmENFencingShow.Create(Application,fmNormal);
   try
      with frmENFencingShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSafetyPrecautionsFilterObj.fencing = nil then ENSafetyPrecautionsFilterObj.fencing := ENFencing.Create();
               ENSafetyPrecautionsFilterObj.fencing.code := StrToInt(GetReturnValue(sgENFencing,0));
               edtENFencingFencingName.Text:=GetReturnValue(sgENFencing,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENFencingShow.Free;
   end;
end;





end.