
unit EditENActPrintFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,ShowENEPRen,
	EnergyproController, EnergyproController2, ENActController,
  ENElementController,ENElementTypeController ;

type
  TfrmENActPrintFilterEdit = class(TDialogForm)

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;

     btnOk: TButton;
     btnCancel: TButton;

    lblFinMolName: TLabel;
    edtFinMolName: TEdit;
    spbFINMol: TSpeedButton;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    cbIsRecalc: TCheckBox;
    HTTPRIOENAct: THTTPRIO;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbFINMolClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    renCode : Integer;

end;

var
  frmENActPrintFilterEdit: TfrmENActPrintFilterEdit;
  ENActFilterObj: ENActFilter;

implementation

uses
  ENConsts,FINMolController, ShowFINMol, ENDepartment2EPRenController,ENDepartmentController,
  DMReportsUnit, ShowENDepartment, ENActStatusController;


{$R *.dfm}


procedure TfrmENActPrintFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAct: ENActControllerSoapPort;
    i : Integer;
    f : ENActFilter;
    l : ENActShortList;
begin

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtDateGen
      ,edtFinMolName
      ,edtEPRenName
     ])  then
  begin
      Application.MessageBox(PChar('ѕустые пол€ недопустимы !'),PChar('¬нимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin


     if ( cbIsRecalc.Checked ) then
     begin
         TempENAct := HTTPRIOENAct as ENActControllerSoapPort;
         f := ENActFilter.Create;
         SetNullIntProps(f);
         SetNullXSProps(f);
         f.dateGen := TXSDate.Create;
         f.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));

         f.finMolCode := ENActFilterObj.finMolCode;

         f.statusRef := ENActStatusRef.Create;
         f.statusRef.code := ENACT_GOOD;

         f.conditionSQL := 'enact.elementcode in (select enelement.code from enelement where enelement.typerefcode = 7 and enelement.renrefcode ='+ IntToStr(ENActFilterObj.element.renRef.code) +')';
         l :=  TempENAct.getScrollableFilteredList(f, 0, -1);
         for i:=0 to l.totalCount - 1 do
         begin
             TempENAct.signatured(l.list[i].code);
         end;
     end;

     if edtDateGen.Checked then
     begin
       if ENActFilterObj.dateGen = nil then
          ENActFilterObj.dateGen := TXSDate.Create;
        ENActFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENActFilterObj.dateGen := nil;

  end;
end;



procedure TfrmENActPrintFilterEdit.spbFINMolClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

  TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  //plan : ENPlanWork;


  molSel : boolean;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

      // –Ё—ы и ћќЋы
      //plan := DMReports.getPlanByCode(planCode);
    if renCode > LOW_INT then
    begin
      TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
      renFilter := ENDepartment2EPRenFilter.Create;
      SetNullXSProps(renFilter);
      SetNullIntProps(renFilter);
      renFilter.renRef := EPRenRef.Create;
      renFilter.renRef.code := renCode; //plan.renRef.code;
      renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
      if renList.totalCount > 0 then
        f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
    end;
    
   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);
   try
      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtFINMolName.Text:= GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               ENActFilterObj.finMolCode := GetReturnValue(sgFINMol,0);
               //ENActFilterObj.finMolName := GetReturnValue(sgFINMol,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;
end;



procedure TfrmENActPrintFilterEdit.spbEPRenClick(Sender: TObject);
var
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENActFilterObj.element = nil then ENActFilterObj.element := ENElement.Create();
               if ENActFilterObj.element.renRef = nil then ENActFilterObj.element.renRef:= EPRenRef.Create;
               ENActFilterObj.element.renRef.code := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;

end;

end.
