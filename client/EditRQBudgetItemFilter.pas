
unit EditRQBudgetItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQBudgetItemController ;

type
  TfrmRQBudgetItemFilterEdit = class(TDialogForm)

    lblDdscode : TLabel;
    edtDdscode: TEdit;

    lblSumGen : TLabel;
    edtSumGen: TEdit;



  HTTPRIORQBudgetItem: THTTPRIO;

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
  frmRQBudgetItemFilterEdit: TfrmRQBudgetItemFilterEdit;
  RQBudgetItemFilterObj: RQBudgetItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQBudgetItemController  ;
}
{$R *.dfm}



procedure TfrmRQBudgetItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDdscode
      ,edtSumGen
      ,edtDateEdit
      ,edtUserGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtDdscode.Text := RQBudgetItemObj.ddscode; 



    if ( RQBudgetItemObj.sumGen <> nil ) then
       edtSumGen.Text := RQBudgetItemObj.sumGen.decimalString
    else
       edtSumGen.Text := ''; 



      if RQBudgetItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQBudgetItemObj.dateEdit.Year,RQBudgetItemObj.dateEdit.Month,RQBudgetItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  



    edtUserGen.Text := RQBudgetItemObj.userGen; 


  end;

}

end;



procedure TfrmRQBudgetItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQBudgetItem: RQBudgetItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQBudgetItemFilterObj.ddscode := edtDdscode.Text; 



     if (RQBudgetItemFilterObj.sumGen = nil ) then
       RQBudgetItemFilterObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
       RQBudgetItemFilterObj.sumGen.decimalString := edtSumGen.Text 
     else
       RQBudgetItemFilterObj.sumGen := nil;




//     if edtdateEdit.checked then
//     begin
//       if RQBudgetItemFilterObj.dateEdit = nil then
//          RQBudgetItemFilterObj.dateEdit := TXSDateTime.Create;
//       RQBudgetItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
//     end
//     else
//       RQBudgetItemFilterObj.dateEdit := nil;



//     RQBudgetItemFilterObj.userGen := edtUserGen.Text;




  end;
end;




end.