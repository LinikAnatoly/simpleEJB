
unit EditENIPItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENIPItemController ;

type
  TfrmENIPItemFilterEdit = class(TDialogForm)
    lblName: TLabel;
    lblItemNumber: TLabel;
    lblInvNumber: TLabel;
    edtItemNumber: TEdit;
    edtInvNumber: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENIPItem: THTTPRIO;
    edtName: TEdit;
    edtInvestProgramGroupsName: TEdit;
    spbInvestProgramGroups: TSpeedButton;
    Label1: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbInvestProgramGroupsClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENIPItemFilterEdit: TfrmENIPItemFilterEdit;
  ENIPItemFilterObj: ENIPItemFilter;

implementation

uses
  ShowTKMeasurement
  ,TKMeasurementController
, ShowENIP, ENIPController, ShowENInvestProgramGroups,
  ENInvestProgramGroupsController, EditENInvestProgramGroupsFilter;

{uses  
    EnergyproController, EnergyproController2, ENIPItemController  ;
}
{$R *.dfm}



procedure TfrmENIPItemFilterEdit.FormShow(Sender: TObject);

begin

DisableControls([edtInvestProgramGroupsName]);

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtItemNumber
      ,edtIsProjectDocument
      ,edtCountGen
      ,edtPrice
      ,edtSumGen
      ,edtQuarter1count
      ,edtQuarter1sum
      ,edtQuarter2count
      ,edtQuarter2sum
      ,edtQuarter3count
      ,edtQuarter3sum
      ,edtQuarter4count
      ,edtQuarter4sum
      ,edtUserAdd
      ,edtDateAdd
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    MakeMultiline(edtName.Lines, ENIPItemObj.name);



    MakeMultiline(edtBuhName.Lines, ENIPItemObj.buhName);



    edtItemNumber.Text := ENIPItemObj.itemNumber; 



    edtInvNumber.Text := ENIPItemObj.invNumber; 



    if ( ENIPItemObj.isProjectDocument <> Low(Integer) ) then
       edtIsProjectDocument.Text := IntToStr(ENIPItemObj.isProjectDocument)
    else
       edtIsProjectDocument.Text := '';



    edtFinancing.Text := ENIPItemObj.financing; 



    MakeMultiline(edtCommentGen.Lines, ENIPItemObj.commentGen);



    if ( ENIPItemObj.countGen <> nil ) then
       edtCountGen.Text := ENIPItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    if ( ENIPItemObj.price <> nil ) then
       edtPrice.Text := ENIPItemObj.price.decimalString
    else
       edtPrice.Text := ''; 



    if ( ENIPItemObj.sumGen <> nil ) then
       edtSumGen.Text := ENIPItemObj.sumGen.decimalString
    else
       edtSumGen.Text := ''; 



    if ( ENIPItemObj.quarter1count <> nil ) then
       edtQuarter1count.Text := ENIPItemObj.quarter1count.decimalString
    else
       edtQuarter1count.Text := ''; 



    if ( ENIPItemObj.quarter1sum <> nil ) then
       edtQuarter1sum.Text := ENIPItemObj.quarter1sum.decimalString
    else
       edtQuarter1sum.Text := ''; 



    if ( ENIPItemObj.quarter2count <> nil ) then
       edtQuarter2count.Text := ENIPItemObj.quarter2count.decimalString
    else
       edtQuarter2count.Text := ''; 



    if ( ENIPItemObj.quarter2sum <> nil ) then
       edtQuarter2sum.Text := ENIPItemObj.quarter2sum.decimalString
    else
       edtQuarter2sum.Text := ''; 



    if ( ENIPItemObj.quarter3count <> nil ) then
       edtQuarter3count.Text := ENIPItemObj.quarter3count.decimalString
    else
       edtQuarter3count.Text := ''; 



    if ( ENIPItemObj.quarter3sum <> nil ) then
       edtQuarter3sum.Text := ENIPItemObj.quarter3sum.decimalString
    else
       edtQuarter3sum.Text := ''; 



    if ( ENIPItemObj.quarter4count <> nil ) then
       edtQuarter4count.Text := ENIPItemObj.quarter4count.decimalString
    else
       edtQuarter4count.Text := ''; 



    if ( ENIPItemObj.quarter4sum <> nil ) then
       edtQuarter4sum.Text := ENIPItemObj.quarter4sum.decimalString
    else
       edtQuarter4sum.Text := ''; 



    edtUserAdd.Text := ENIPItemObj.userAdd; 



      if ENIPItemObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(ENIPItemObj.dateAdd.Year,ENIPItemObj.dateAdd.Month,ENIPItemObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



    edtUserGen.Text := ENIPItemObj.userGen; 



      if ENIPItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENIPItemObj.dateEdit.Year,ENIPItemObj.dateEdit.Month,ENIPItemObj.dateEdit.Day);
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



procedure TfrmENIPItemFilterEdit.spbInvestProgramGroupsClick(Sender: TObject);
var
   frmENInvestProgramGroupsShow : TfrmENInvestProgramGroupsShow;
   f : ENInvestProgramGroupsFilter;
begin
   f := ENInvestProgramGroupsFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   frmENInvestProgramGroupsShow := TfrmENInvestProgramGroupsShow.Create(Application, fmNormal, f);

   try
      with frmENInvestProgramGroupsShow do begin
        if ShowModal = mrOk then
        begin
            try
               if ENIPItemFilterObj.invgroupRef = nil then ENIPItemFilterObj.invgroupRef := ENInvestProgramGroupsRef.Create();
               ENIPItemFilterObj.invgroupRef.code := StrToInt(GetReturnValue(sgENInvestProgramGroups,0));
               edtInvestProgramGroupsName.Text := GetReturnValue(sgENInvestProgramGroups,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENInvestProgramGroupsShow.Free;
   end;

end;

procedure TfrmENIPItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENIPItem: ENIPItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin


     ENIPItemFilterObj.name := edtName.Text;



     ENIPItemFilterObj.itemNumber := edtItemNumber.Text;



     ENIPItemFilterObj.invNumber := edtInvNumber.Text; 



 
     if (ENIPItemFilterObj.countGen = nil ) then
       ENIPItemFilterObj.countGen := TXSDecimal.Create;





     if (ENIPItemFilterObj.price = nil ) then
       ENIPItemFilterObj.price := TXSDecimal.Create;





     if (ENIPItemFilterObj.sumGen = nil ) then
       ENIPItemFilterObj.sumGen := TXSDecimal.Create;




     if (ENIPItemFilterObj.quarter1count = nil ) then
       ENIPItemFilterObj.quarter1count := TXSDecimal.Create;





     if (ENIPItemFilterObj.quarter1sum = nil ) then
       ENIPItemFilterObj.quarter1sum := TXSDecimal.Create;




     if (ENIPItemFilterObj.quarter2count = nil ) then
       ENIPItemFilterObj.quarter2count := TXSDecimal.Create;





     if (ENIPItemFilterObj.quarter2sum = nil ) then
       ENIPItemFilterObj.quarter2sum := TXSDecimal.Create;


     if (ENIPItemFilterObj.quarter3count = nil ) then
       ENIPItemFilterObj.quarter3count := TXSDecimal.Create;




     if (ENIPItemFilterObj.quarter3sum = nil ) then
       ENIPItemFilterObj.quarter3sum := TXSDecimal.Create;




     if (ENIPItemFilterObj.quarter4count = nil ) then
       ENIPItemFilterObj.quarter4count := TXSDecimal.Create;



     if (ENIPItemFilterObj.quarter4sum = nil ) then
       ENIPItemFilterObj.quarter4sum := TXSDecimal.Create;











  end;
end;

end.
