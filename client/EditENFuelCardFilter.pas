
unit EditENFuelCardFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuelCardController ;

type
  TfrmENFuelCardFilterEdit = class(TDialogForm)

    lblReg_id : TLabel;
    edtReg_id: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblFINWorkerFinWorkerName : TLabel;
  edtFINWorkerFinWorkerName : TEdit;
  spbFINWorkerFinWorker : TSpeedButton;
  

  HTTPRIOENFuelCard: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbFINWorkerFinWorkerClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENFuelCardFilterEdit: TfrmENFuelCardFilterEdit;
  ENFuelCardFilterObj: ENFuelCardFilter;

implementation

uses
  ShowFINWorker
  ,FINWorkerController
;

{uses  
    EnergyproController, EnergyproController2, ENFuelCardController  ;
}
{$R *.dfm}



procedure TfrmENFuelCardFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtReg_id
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtReg_id.Text := ENFuelCardObj.reg_id; 



    edtUserGen.Text := ENFuelCardObj.userGen; 



      if ENFuelCardObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENFuelCardObj.dateEdit.Year,ENFuelCardObj.dateEdit.Month,ENFuelCardObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  


  end;

}

end;



procedure TfrmENFuelCardFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelCard: ENFuelCardControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENFuelCardFilterObj.reg_id := edtReg_id.Text; 



     ENFuelCardFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENFuelCardFilterObj.dateEdit = nil then
          ENFuelCardFilterObj.dateEdit := TXSDateTime.Create;
       ENFuelCardFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENFuelCardFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENFuelCardFilterEdit.spbFINWorkerFinWorkerClick(Sender : TObject);
var 
   frmFINWorkerShow: TfrmFINWorkerShow;
begin
   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal);
   try
      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENFuelCardFilterObj.finWorker = nil then ENFuelCardFilterObj.finWorker := FINWorker.Create();
               ENFuelCardFilterObj.finWorker.code := StrToInt(GetReturnValue(sgFINWorker,0));
               edtFINWorkerFinWorkerName.Text:=GetReturnValue(sgFINWorker,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;





end.