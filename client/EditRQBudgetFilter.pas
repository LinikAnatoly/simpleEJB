
unit EditRQBudgetFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQBudgetController ;

type
  TfrmRQBudgetFilterEdit = class(TDialogForm)

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;



  HTTPRIORQBudget: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQBudgetFilterEdit: TfrmRQBudgetFilterEdit;
  RQBudgetFilterObj: RQBudgetFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQBudgetController  ;
}
{$R *.dfm}



procedure TfrmRQBudgetFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtDateGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberGen.Text := RQBudgetObj.numberGen; 



      if RQBudgetObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(RQBudgetObj.dateGen.Year,RQBudgetObj.dateGen.Month,RQBudgetObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    edtCommentGen.Text := RQBudgetObj.commentGen; 


  end;

}

end;



procedure TfrmRQBudgetFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQBudget: RQBudgetControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQBudgetFilterObj.numberGen := edtNumberGen.Text; 



     if edtdateGen.checked then
     begin 
       if RQBudgetFilterObj.dateGen = nil then
          RQBudgetFilterObj.dateGen := TXSDate.Create;
       RQBudgetFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       RQBudgetFilterObj.dateGen := nil;



     RQBudgetFilterObj.commentGen := edtCommentGen.Text; 




  end;
end;




end.