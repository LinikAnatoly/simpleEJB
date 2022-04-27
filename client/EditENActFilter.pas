
unit EditENActFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,ShowENEPRen,
	EnergyproController, EnergyproController2, ENActController,ENElementTypeController ;

type
  TfrmENActFilterEdit = class(TDialogForm)

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblFinDocCode : TLabel;
    edtFinDocCode: TEdit;
    lblFinMolCode : TLabel;
    edtFinMolCode: TEdit;
    lblFinMolName_: TLabel;
    edtFinMolName_: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENAct: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblFinMechanicName: TLabel;
    lblFinMolName: TLabel;
    edtFinMolName: TEdit;
    edtFinMechanicName: TEdit;
    spbFINMechanic: TSpeedButton;
    spbFINMol: TSpeedButton;
    lblWorkState: TLabel;
    edtWorkState: TEdit;
    spbENPlanWorkState: TSpeedButton;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    lblElementType: TLabel;
    cbElementType: TComboBox;
    HTTPRIOENElementType: THTTPRIO;
    lblENDepartmentDepartmentName: TLabel;
    edtENDepartmentDepartmentName: TEdit;
    spbENDepartmentDepartment: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    edtDateGenTo: TDateTimePicker;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    lblENActStatusStatusName: TLabel;
    edtENActStatusStatusName: TEdit;
    spbENActStatusStatus: TSpeedButton;
    spbENActStatusClear: TSpeedButton;
    spbOSSelect: TSpeedButton;
    edtInvNumber: TEdit;
    lblInvNumber: TLabel;
    cbShowActEneOz: TCheckBox;
    btnExportExcel: TButton;
    chkAUP: TCheckBox;
    lblTypeName: TLabel;
    edtTypeName: TEdit;
    btnType: TSpeedButton;
    btn1: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtDateAct: TDateTimePicker;
    edtDateActTo: TDateTimePicker;
    edtCode: TEdit;
    Label6: TLabel;
    cmbCheckedByAccountant: TComboBox;
    lblCheckedByAccountant: TLabel;
    lblServicesConnections: TLabel;
    edtPriconnectionNumber: TEdit;
    spbPriconnectionNumber: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);

  procedure spbENElementElementClick(Sender : TObject);
    procedure spbENPlanWorkStateClick(Sender: TObject);
    procedure spbFINMolClick(Sender: TObject);
    procedure spbFINMechanicClick(Sender: TObject);
    procedure spbENDepartmentDepartmentClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbENActStatusClearClick(Sender: TObject);
    procedure spbENActStatusStatusClick(Sender: TObject);
    procedure spbOSSelectClick(Sender: TObject);
    procedure btnExportExcelClick(Sender: TObject);
    procedure chkAUPClick(Sender: TObject);
    procedure btnTypeClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure spbPriconnectionNumberClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    renCode : Integer;
    podrCode : Integer;
    workTypeCode : Integer;
    FINMECHANICCODE : Integer;
    isoz1:Boolean;

end;

var
  frmENActFilterEdit: TfrmENActFilterEdit;
  ENActFilterObj: ENActFilter;

implementation

uses
  ShowENElement
  ,ENElementController
, ShowENPlanWorkState, ENPlanWorkStateController, ENConsts,
  FINMolController, ShowFINMol, ENDepartment2EPRenController,ENDepartmentController,
  DMReportsUnit, ShowENDepartment, ENDepartmentTypeController,
  ShowENActStatus, ENActStatusController, ShowOStable, OSTableController , ShowENPlanWorkType , ENPlanWorkTypeController ,
  ENServicesObjectController, ShowENServicesConnection,
  ENServicesContractTypeController, ENServicesContractKindController;

{uses  
    EnergyproController, EnergyproController2, ENActController  ;
}
{$R *.dfm}



procedure TfrmENActFilterEdit.FormShow(Sender: TObject);
 var
 TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
 f : ENElementTypeFilter;
 i : Integer;
begin

  //DisableControls([spbENPlanWorkState]);

  renCode := LOW_INT;
  podrCode := LOW_INT;
  workTypeCode := LOW_INT;
  FINMECHANICCODE := LOW_INT;

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtDateGen
      ,edtFinDocCode
      ,edtFinMolCode
      ,edtFinMolName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberGen.Text := ENActObj.numberGen; 



      if ENActObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENActObj.dateGen.Year,ENActObj.dateGen.Month,ENActObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    if ( ENActObj.finDocCode <> Low(Integer) ) then
       edtFinDocCode.Text := IntToStr(ENActObj.finDocCode)
    else
       edtFinDocCode.Text := '';



    edtFinMolCode.Text := ENActObj.finMolCode; 



    edtFinMolName.Text := ENActObj.finMolName; 



    edtCommentGen.Text := ENActObj.commentGen;



    edtUserGen.Text := ENActObj.userGen; 



      if ENActObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENActObj.dateEdit.Year,ENActObj.dateEdit.Month,ENActObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;

}

 cbElementType.Clear;

  f:= ENElementTypeFilter.Create;
  SetNullIntProps(f);
  //f.conditionSQL := 'code in (1,2,3,5,6,7,8,9,10,11)';
  f.conditionSQL := SQL_NO_SELECTED_ELEMENT_TYPE; //'code <> 4';
  f.orderBySQL := 'code';

TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
  ENElementTypeList := TempENElementType.getScrollableFilteredList(f,0,-1);
  for i:=0 to ENElementTypeList.totalCount-1 do
  begin
    cbElementType.Items.AddObject(ENElementTypeList.list[i].name, TObject(ENElementTypeList.list[i].code));
  end;

  DisableControls([ edtENElementElementName, edtENDepartmentDepartmentName
                    , edtWorkState,  edtENActStatusStatusName, edtENBudgetName
                    , edtFinMolName , edtFinMechanicName , edtInvNumber  , edtTypeName , edtPriconnectionNumber
                  ]);

end;



procedure TfrmENActFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAct: ENActControllerSoapPort;
    condition : String;
begin
  if (ModalResult = mrOk)  then
  begin

     ENActFilterObj.numberGen := edtNumberGen.Text;

     condition := '';

     if cbElementType.ItemIndex > -1 then
     begin
       //if length(ENActFilterObj.conditionSQL)>0 then
       //  ENActFilterObj.conditionSQL := ENActFilterObj.conditionSQL +
       //  ' AND ENACT.ELEMENTCODE IN (SELECT CODE FROM ENELEMENT WHERE ENELEMENT.TYPEREFCODE='+IntToStr(Integer(cbElementType.Items.Objects[cbElementType.ItemIndex]))+') '
       //else
       //  ENActFilterObj.conditionSQL:= ' ENACT.ELEMENTCODE IN (SELECT CODE FROM ENELEMENT WHERE ENELEMENT.TYPEREFCODE='+IntToStr(Integer(cbElementType.Items.Objects[cbElementType.ItemIndex]))+') ';
       AddCondition(condition, ' ENACT.ELEMENTCODE IN (SELECT CODE FROM ENELEMENT WHERE ENELEMENT.TYPEREFCODE='+IntToStr(Integer(cbElementType.Items.Objects[cbElementType.ItemIndex]))+') ');
     end;


     if edtDateGen.checked then
     begin
       AddCondition(condition, ' ENACT.dategen >= to_date(''' + DateToStr(edtDateGen.Date) + ''', ''dd.MM.yyyy'')');
     end;

     if edtDateGenTo.checked then
     begin
       AddCondition(condition, ' ENACT.dategen <= to_date(''' + DateToStr(edtDateGenTo.Date) + ''', ''dd.MM.yyyy'')');
     end;


     if edtDateAct.checked then
     begin
       AddCondition(condition, ' ENACT.dateact >= to_date(''' + DateToStr(edtDateAct.Date) + ''', ''dd.MM.yyyy'')');
     end;

     if edtDateActTo.checked then
     begin
       AddCondition(condition, ' ENACT.dateact <= to_date(''' + DateToStr(edtDateActTo.Date) + ''', ''dd.MM.yyyy'')');
     end;

     if edtInvNumber.Text <> '' then
     begin
       if cbShowActEneOz.Checked = True
        then
        AddCondition(condition, 'enact.elementcode in (select enelementdata.ecode from enelementdata where upper(enelementdata.invnumber) like upper(''' + ToLIKE(edtInvNumber.Text) + ''') )' );

     end;

     if Length(ENActFilterObj.conditionSQL) > 0 then
        AddCondition(condition, ENActFilterObj.conditionSQL) ;

     if cbShowActEneOz.Checked then
     begin
       // сказали убирать все акты по енергосбыту 02.09.2011 
       //   AddCondition(condition, 'enact.code not in ( select enactrefcode from  scusageinputitemoz2nct )' );

       {
            AddCondition(condition, 'enact.code not in ( select a.code  from enact a , enact2enplanwork a2p , enplanwork p ' +
                                                         ' where a.code = a2p.actrefcode  '  +
                                                         '   and a2p.plancode = p.code ' +
                                                         '   and p.budgetrefcode = 240000001 )' );
       }


       //*  SUPP-34965...  мега тормоза not in ЭБ  */
       AddCondition(condition,
            ' enelement.typerefcode not in (' +
            ' select et.code from enelementtype et ' +
            ' where et.managementrefcode = ' + IntToStr(ENMANAGEMENT_TYPE_ENERGOSBYT) +
            '   or et.code = ' + IntToStr(EN_SERVICES_OBJECT) + ') ');
     end;


     if podrCode <> LOW_INT then
      begin
        AddCondition(condition,'  ENACT.CODE IN (select a.code from enact a,enact2enplanwork ap, enplanwork p '+
                                  ' where a.code=ap.actrefcode and p.code=ap.plancode and p.departmentrefcode= '
                                   +inttostr(podrCode) +')');
      end;

       if workTypeCode <> LOW_INT then
      begin
        AddCondition(condition,'  ENACT.CODE IN (select a.code from enact a,enact2enplanwork ap, enplanwork p '+
                                  ' where a.code=ap.actrefcode and p.code=ap.plancode and p.typerefcode= '
                                   +inttostr(workTypeCode) +')');
      end;


      if chkAUP.Checked = True then
      begin
        AddCondition(condition,'  ENACT.CODE IN (select a.code from enact a,enact2enplanwork ap, enplanwork p '+
                                  ' where a.code=ap.actrefcode and p.code=ap.plancode and p.departmentrefcode in ( '
                                   + DMReports.getDepartmentCodesDown(ENDEPARTMENT_CO) +' ) )');
      end;



      // механик
      if FINMECHANICCODE <> LOW_INT then
      begin
        AddCondition(condition,'  ENACT.CODE IN (  select fd.actcode from finmoldata fd ' +
                         ' Where fd.finmolcode = ' + '''' + IntToStr(FINMECHANICCODE) + '''' +
                         ' and fd.moltyperefcode = 2 /*Механік*/ ' +
                         ' and fd.actcode is not null )');
      end;

           // SUPP-78694
	 if cmbCheckedByAccountant.ItemIndex > -1 then begin
	     if cmbCheckedByAccountant.ItemIndex = 0 then begin
		     ENActFilterObj.checkedByAccountant := TXSBoolean.Create;
			 ENActFilterObj.checkedByAccountant.asBoolean := true;
		 end;
	     if cmbCheckedByAccountant.ItemIndex = 1 then begin
         AddCondition(condition, ' COALESCE(ENACT.CHECKEDBYACCOUNTANT, false) = false ');
		 end;
	 end;


     ENActFilterObj.conditionSQL :=  condition ;

{
     if edtDateGen.Checked then
     begin
       if ENActFilterObj.dateGen = nil then
          ENActFilterObj.dateGen := TXSDate.Create;
        ENActFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENActFilterObj.dateGen := nil;
}

      if ( edtCode.Text <> '' ) then
       ENActFilterObj.code := StrToInt(edtCode.Text)
     else
       ENActFilterObj.code := Low(Integer) ;


{
     if ( edtFinDocCode.Text <> '' ) then
       ENActFilterObj.finDocCode := StrToInt(edtFinDocCode.Text)
     else
       ENActFilterObj.finDocCode := Low(Integer) ;

     ENActFilterObj.finMolCode := edtFinMolCode.Text;
     ENActFilterObj.finMolName := edtFinMolName.Text;

}
     ENActFilterObj.commentGen := edtCommentGen.Text;


{
     ENActFilterObj.userGen := edtUserGen.Text;

     if ENActFilterObj.dateEdit = nil then
        ENActFilterObj.dateEdit := TXSDate.Create;
      ENActFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
}

  end;
end;

procedure TfrmENActFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
   tElement : ENElement;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try

              {
               if ENElementFilter(frmENElementShow.FilterObject).renRef = nil then
               begin
                 renCode := ENElementShort(frmENElementShow.sgENElement.Objects[frmENElementShow.sgENElement.Row, 0]).renRefCode;
               end
               else
                 renCode := ENElementFilter(frmENElementShow.FilterObject).renRef.code;
               }

               if ENActFilterObj.element = nil then ENActFilterObj.element := ENElement.Create();
               ENActFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);

               tElement := DMReports.getElementByCode(ENActFilterObj.element.code);
               if (tElement <> nil) then
                  renCode := tElement.renRef.code;

               //DisableControls([spbENPlanWorkState], false);
               //DisableControls([spbENElementElement]);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;





procedure TfrmENActFilterEdit.spbENPlanWorkStateClick(Sender: TObject);
var
   frmENPlanWorkStateShow: TfrmENPlanWorkStateShow;
   f : ENPlanWorkStateFilter;
   //e : ENElement;
begin
   f:= ENPlanWorkStateFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.conditionSQL := 'enplanworkstate.code < 100';

   f.orderBySQL := 'ordered';
   //f.conditionSQL := 'enplanworkstate.code in (select enplantype2planstate.staterefcode from enplantype2planstate where enplantype2planstate.typerefcode = '+ IntToStr(ENPlanWorkObj.typeRef.code) +')';

   //e := DMReports.getElementByCode(ENActFilterObj.element.code);

   //if e.typeRef.code <> EN_SUBSTATION150 then
   //   f.conditionSQL := 'enplanworkstate.code <> ' + IntToStr(ENPLANWORKSTATE_CURRENTREPAIR);

   frmENPlanWorkStateShow:=TfrmENPlanWorkStateShow.Create(Application,fmNormal,f);
   try
      with frmENPlanWorkStateShow do begin
        DisableActions([ actEdit, actInsert, actDelete, actNoFilter, actFilter ]);
        if ShowModal = mrOk then
        begin
            try
               if ENActFilterObj.actTypeRef = nil then ENActFilterObj.actTypeRef := ENPlanWorkStateRef.Create();
               ENActFilterObj.actTypeRef.code := StrToInt(GetReturnValue(sgENPlanWorkState,0));//ENDepartmentShort(tvDep.Selected.Data).code;
               edtWorkState.Text:= GetReturnValue(sgENPlanWorkState,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkStateShow.Free;
   end;

end;

procedure TfrmENActFilterEdit.spbFINMolClick(Sender: TObject);
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

      // РЭСы и МОЛы
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

procedure TfrmENActFilterEdit.spbFINMechanicClick(Sender: TObject);
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

      // РЭСы и МОЛы
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
               edtFinMechanicName.Text:= GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               //NET-4299 будем искать через sqlstatement  //ENActFilterObj.finMechanicCode := GetReturnValue(sgFINMol,0);
               FINMECHANICCODE := StrToInt( GetReturnValue(sgFINMol,0));
               //ENActFilterObj.finMechanicName := GetReturnValue(sgFINMol,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;
end;

procedure TfrmENActFilterEdit.spbENDepartmentDepartmentClick(
  Sender: TObject);
var 
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
 
   f.code := 1;
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
            try

                //                 if length(ENActFilterObj.conditionSQL)>0 then
                //                  ENActFilterObj.conditionSQL:=ENActFilterObj.conditionSQL+
                //                  ' AND ENACT.CODE IN (select a.code from enact a,enact2enplanwork ap, enplanwork p '+
                //                  ' where a.code=ap.actrefcode and p.code=ap.plancode and p.departmentrefcode= '
                //                   +inttostr(ENDepartmentShort(tvDep.Selected.Data).code) +')'
                //                else
                //                  ENActFilterObj.conditionSQL:=
                //                  ' ENACT.CODE IN (select a.code from enact a,enact2enplanwork ap, enplanwork p '+
                //                  ' where a.code=ap.actrefcode and p.code=ap.plancode and p.departmentrefcode= '
                //                   +inttostr(ENDepartmentShort(tvDep.Selected.Data).code) +')';
                 podrCode :=  ENDepartmentShort(tvDep.Selected.Data).code;
                 edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmENActFilterEdit.spbENBudgetClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
   sql : String;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   f.conditionSQL := ' parentrefcode is null';

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try

      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               //if ENPlanWorkFilterObj.budgetRef = nil then ENPlanWorkFilterObj.budgetRef := ENDepartmentRef.Create();
               //ENPlanWorkFilterObj.budgetRef.code := ENDepartmentShort(tvDep.Selected.Data).code;

                 if length(ENActFilterObj.conditionSQL)>0 then
                  ENActFilterObj.conditionSQL:=ENActFilterObj.conditionSQL+
                  ' AND ENACT.CODE IN (select ap.actrefcode from enact2enplanwork ap, enplanwork p '+
                  ' where p.code=ap.plancode and p.budgetrefcode= '
                   +inttostr(ENDepartmentShort(tvDep.Selected.Data).code) +')'
                else
                  ENActFilterObj.conditionSQL:=
                  ' ENACT.CODE IN (select ap.actrefcode from enact2enplanwork ap, enplanwork p '+
                  ' where p.code=ap.plancode and p.budgetrefcode= '
                   +inttostr(ENDepartmentShort(tvDep.Selected.Data).code) +')';
                                  
               edtENBudgetName.Text:=ENDepartmentShort(tvDep.Selected.Data).shortName ;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;


end;

procedure TfrmENActFilterEdit.spbENActStatusClearClick(Sender: TObject);
begin
  inherited;
  
  edtENActStatusStatusName.Text := '';
  if ENActFilterObj.statusRef <> nil then
    ENActFilterObj.statusRef.code := LOW_INT;

end;

procedure TfrmENActFilterEdit.spbENActStatusStatusClick(Sender: TObject);
var
   frmENActStatusShow: TfrmENActStatusShow;
begin
   frmENActStatusShow:=TfrmENActStatusShow.Create(Application,fmNormal);
   try
      with frmENActStatusShow do
      begin
        DisableActions([actInsert, actDelete, actEdit, actFilter, actNoFilter]);
        if ShowModal = mrOk then
        begin
            try
               if ENActFilterObj.statusRef = nil then ENActFilterObj.statusRef := ENActStatusRef.Create();
               ENActFilterObj.statusRef.code := StrToInt(GetReturnValue(sgENActStatus,0));
               edtENActStatusStatusName.Text:=GetReturnValue(sgENActStatus,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENActStatusShow.Free;
   end;
end;

procedure TfrmENActFilterEdit.spbOSSelectClick(Sender: TObject);
var
  frmOSTableShow: TfrmOSTableShow;
  f: OStableFilter;

//  frmTMatherialShow: TfrmTMatherialShow;
//  fMaterial: TMatherialFilter;
begin

//  if rdbOS.Checked then // Выбор из основных
  begin
    f := OStableFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.conditionSQL := ' OSTABLE.KOD_VID in (1, 2, 3, 11, 13, 15, 24, 38) '; // подстанции как СИЛ.МАШИНЫ И ОБОРУД НЕ АВТОМ (11) ...

    if length(edtInvNumber.Text) > 0 then
      f.kod_inv := '*' + edtInvNumber.Text + '*';

    f.orderBySQL :=  'OSTABLE.STR_NAME';

    frmOSTableShow:=TfrmOSTableShow.Create(Application,fmNormal,f);
    //frmOSTableShow.SendType := 444; /// для энерго ....
    try
      with frmOSTableShow do
        if ShowModal = mrOk then
        begin
          try
            //TKElementToFinCollectionObj.fincode := StrToInt(GetReturnValue(sgOSTable,0));
            edtInvNumber.Text :=  GetReturnValue(sgOSTable,2);
            //edtBuhName.Text := GetReturnValue(sgOSTable,1);
            //DisableControls([edtInvNumber, edtBuhName]);
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmOSTableShow.Free;
    end;
  end;
  (*
  else begin // Выбор из материалов
    fMaterial := TMatherialFilter.Create;
    SetNullIntProps(fMaterial);
    SetNullXSProps(fMaterial);

    if length(edtInvNumber.Text) > 0 then
      fMaterial.nn := '*' + edtInvNumber.Text + '*';

    fMaterial.orderBySQL :=  'TMATHERIAL.NAME';

    frmTMatherialShow := TfrmTMatherialShow.Create(Application, fmNormal, fMaterial);
    try
      with frmTMatherialShow do
        if ShowModal = mrOk then
        begin
          try
            edtInvNumber.Text := GetReturnValue(sgTMatherial,2);
            edtBuhName.Text := GetReturnValue(sgTMatherial,1);
            DisableControls([edtInvNumber, edtBuhName]);
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmTMatherialShow.Free;
    end;
  end;
  *)
  
end;

procedure TfrmENActFilterEdit.spbPriconnectionNumberClick(Sender: TObject);
var
  f : ENServicesObjectFilter;
  frmENServicesConnectionShow : TfrmENServicesConnectionShow;
  soCode :Integer;
begin
  inherited;

  f := ENServicesObjectFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.contractTypeRef := ENServicesContractTypeRef.Create;
  f.contractTypeRef.code := ENSERVICESOBJECTTYPE_CONNECTION;

  f.contractKindRef := ENServicesContractKindRef.Create;
  f.contractKindRef.code := SERVICES_CONTRACT_KIND_SERVICES;

  frmENServicesConnectionShow := TfrmENServicesConnectionShow.Create(Application, fmNormal, f);
  try
  DisableActions([frmENServicesConnectionShow.actInsert, frmENServicesConnectionShow.actEdit,
    frmENServicesConnectionShow.actDelete]);

    with frmENServicesConnectionShow do
    if ShowModal = mrOk then
    begin
      try
        soCode := StrToInt(GetReturnValue(sgENServicesObject,0));

        if length(ENActFilterObj.conditionSQL)>0 then
          ENActFilterObj.conditionSQL:=ENActFilterObj.conditionSQL+
          ' and enact.CODE in ( select a.code from enact a where a.code in ( 	 select a2pl.actrefcode from enact2enplanwork a2pl '+
          ' where a2pl.plancode in ( 	  select ct2pl.planrefcode from entechcond2planwork ct2pl '+
          ' where ct2pl.techconservicesrefcode in (SELECT techcondservrefcode FROM net.enservicesobject2techcondtnsservices where servicesobjectrefcode = '+ IntToStr(soCode) + ' ) '+
          ' union '+
          ' select ppp.code from enplanwork ppp, enservicesobject so where ppp.elementrefcode = so.elementcode and ppp.kindcode=4 and so.code = ' + IntToStr(soCode) +
          ' ) ) ' +
          ' )'
        else
          ENActFilterObj.conditionSQL:=
          ' enact.CODE in ( select a.code from enact a where a.code in ( 	 select a2pl.actrefcode from enact2enplanwork a2pl '+
          ' where a2pl.plancode in ( 	  select ct2pl.planrefcode from entechcond2planwork ct2pl '+
          ' where ct2pl.techconservicesrefcode in (SELECT techcondservrefcode FROM net.enservicesobject2techcondtnsservices where servicesobjectrefcode = '+ IntToStr(soCode) + ' ) '+
          ' union '+
          ' select ppp.code from enplanwork ppp, enservicesobject so where ppp.elementrefcode = so.elementcode and ppp.kindcode=4 and so.code = ' + IntToStr(soCode) +
          ' ) ) ' +
          ' )';

        edtPriconnectionNumber.Text := GetReturnValue(sgENServicesObject,1);// + ', ' + GetReturnValue(sgENServicesObject,5);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENServicesConnectionShow.Free;
  end;
end;

procedure TfrmENActFilterEdit.btnExportExcelClick(Sender: TObject);
 var
  argNames, args: ArrayOfString;
  reportName: String;
  condition : String;
begin
  try
  SetLength(argNames, 15);
  SetLength(args, 15);
       condition := '';
       // ЕКСПОРТ  в ексель так же не берем отмененные акты 
          AddCondition(condition,' and enact.statusrefcode <> ' + IntToStr(ENACT_CANCELED));

       if cbElementType.ItemIndex > -1 then
       begin
        AddCondition(condition, ' ENACT.ELEMENTCODE IN (SELECT CODE FROM ENELEMENT WHERE ENELEMENT.TYPEREFCODE='+IntToStr(Integer(cbElementType.Items.Objects[cbElementType.ItemIndex]))+') ');
       end;

       if edtDateGen.checked then
       begin
        AddCondition(condition, ' ENACT.dategen >= to_date(''' + DateToStr(edtDateGen.Date) + ''', ''dd.MM.yyyy'')');
       end;

       if edtDateGenTo.checked then
       begin
        AddCondition(condition, ' ENACT.dategen <= to_date(''' + DateToStr(edtDateGenTo.Date) + ''', ''dd.MM.yyyy'')');
       end;

       if edtInvNumber.Text <> '' then
       begin
         if cbShowActEneOz.Checked = True
          then
          AddCondition(condition, ' enact.elementcode in (select enelementdata.ecode from enelementdata where upper(enelementdata.invnumber) like upper(''' + ToLIKE(edtInvNumber.Text) + ''') )' );
       end;


       
          
       if Length(ENActFilterObj.conditionSQL) > 0 then
          AddCondition(condition, ENActFilterObj.conditionSQL) ;

       if cbShowActEneOz.Checked then
       begin
         // сказали убирать все акты по енергосбыту 02.09.2011
          AddCondition(condition, ' enact.code not in ( select a.code  from enact a , enact2enplanwork a2p , enplanwork p ' +
                                                         ' where a.code = a2p.actrefcode  '  +
                                                         '   and a2p.plancode = p.code ' +
                                                         '   and p.budgetrefcode = 240000001 )' );
       end;

      if podrCode <> LOW_INT then
      begin
        AddCondition(condition,'  ENACT.CODE IN (select a.code from enact a,enact2enplanwork ap, enplanwork p '+
                                  ' where a.code=ap.actrefcode and p.code=ap.plancode and p.departmentrefcode= '
                                   +inttostr(podrCode) +')');
      end;



      if workTypeCode <> LOW_INT then
      begin
        AddCondition(condition,'  ENACT.CODE IN (select a.code from enact a,enact2enplanwork ap, enplanwork p '+
                                  ' where a.code=ap.actrefcode and p.code=ap.plancode and p.typerefcode= '
                                   +inttostr(workTypeCode) +')');
      end;


       if chkAUP.Checked = True then
      begin
        AddCondition(condition,'  ENACT.CODE IN (select a.code from enact a,enact2enplanwork ap, enplanwork p '+
                                  ' where a.code=ap.actrefcode and p.code=ap.plancode and p.departmentrefcode in ( '
                                   + DMReports.getDepartmentCodesDown(ENDEPARTMENT_CO) +' ) )');
      end;

       // механик
      if FINMECHANICCODE <> LOW_INT then
      begin
        AddCondition(condition,'  ENACT.CODE IN (  select fd.actcode from finmoldata fd ' +
                         ' Where fd.finmolcode = ' + '''' + IntToStr(FINMECHANICCODE) + '''' +
                         ' and fd.moltyperefcode = 2 /*Механік*/ ' +
                         ' and fd.actcode is not null )');
      end;



  argNames[0] := 'condition';
  if Trim(condition) <> '' then
  args[0] := condition
  else
  args[0] := '';

  argNames[1] := 'numbergen';
  if Trim(edtNumberGen.Text) <> '' then
  args[1] := ' and UPPER(ENACT.NUMBERGEN) like ' + 'UPPER(' + '''' + ToLIKE(Trim(edtNumberGen.Text)) + '''' + ') '
  else
  args[1] := '';

  argNames[2] := 'comment';
  if Trim(edtCommentGen.Text) <> '' then
  args[2] := ' and UPPER(ENACT.COMMENTGEN) like ' + 'UPPER(' + '''' +  ToLIKE(trim(edtCommentGen.Text)) + '''' +  ') '
  else
  args[2] := '';

  argNames[3] := 'finmolcode';
  if Trim(ENActFilter(ENActFilterObj).finMolCode) <> '' then
  args[3] := ' and ENACT.FINMOLCODE like (' + '''' +  ToLIKE(ENActFilter(ENActFilterObj).finMolCode) + '''' + ') '
  else
  args[3] := '';


   argNames[4] := 'finmechaniccode';
     {  NET-4299 фильтр по механикам в кондишине
  if Trim(ENActFilter(ENActFilterObj).finMechanicCode) <> '' then
  args[4] := ' and ENACT.FINMECHANICCODE like (' + '''' +  ToLIKE(ENActFilter(ENActFilterObj).finMechanicCode)  + '''' + ') '
  else
  args[4] := ''; }

  argNames[5] := 'elementcode';
  if ENActFilterObj.element <> nil then
  args[5] := ' and ENACT.ELEMENTCODE =  ' +  IntToStr(ENActFilter(ENActFilterObj).element.code)
  else
  args[5] := '';


  argNames[6] := 'acttype';
  if ENActFilterObj.actTypeRef <> nil then
  args[6] := ' and ENACT.ACTTYPEREFCODE =  ' +  IntToStr(ENActFilter(ENActFilterObj).actTypeRef.code)
  else
  args[6] := '';



    argNames[7] := 'actstatus';
  if ENActFilterObj.statusRef <> nil then
  args[7] := ' and ENACT.STATUSREFCODE =  ' +  IntToStr(ENActFilter(ENActFilterObj).statusRef.code)
  else
  args[7] := '';
                      
  reportName := 'rep_execute_acts';
  makeReport(reportName, argNames, args, 'xls');

  //  Application.MessageBox(PChar('код акта ' +  IntToStr(codact) + '!!!'), PChar('Внимание !'),MB_ICONWARNING);

   finally
  //  frmENActFilterEdit.close;
//    frmENActFilterEdit.Free;
 //   frmENActFilterEdit:=nil;

  end;
end;

procedure TfrmENActFilterEdit.chkAUPClick(Sender: TObject);
begin
 // inherited;
    if chkAUP.Checked = True then
    begin
      DisableControls([spbENDepartmentDepartment]);
      podrCode := LOW_INT;
      edtENDepartmentDepartmentName.Text := '';
    end
    else
    DisableControls([spbENDepartmentDepartment],false);
end;

procedure TfrmENActFilterEdit.btnTypeClick(Sender: TObject);
var
   frmENPlanWorkTypeShow: TfrmENPlanWorkTypeShow;
   f : ENPlanWorkTypeFilter;
begin
   frmENPlanWorkTypeShow:=TfrmENPlanWorkTypeShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkTypeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try

              // ENPlanWorkFilterObj.typeRef.code := StrToInt(GetReturnValue(sgENPlanWorkType,0));//ENDepartmentShort(tvDep.Selected.Data).code;
               edtTypeName.Text:= GetReturnValue(sgENPlanWorkType,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               workTypeCode :=   StrToInt(GetReturnValue(sgENPlanWorkType,0));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkTypeShow.Free;
   end;
end;

procedure TfrmENActFilterEdit.btn1Click(Sender: TObject);
begin

  workTypeCode := LOW_INT;
  edtTypeName.Text := '';

end;

end.
