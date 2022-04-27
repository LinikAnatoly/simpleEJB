
unit EditENSzBrigade;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSzBrigadeController, AdvObj, ExtCtrls,
  ENEstimateItemController;

type
    TfrmENSzBrigadeEdit = class(TDialogForm)

    lblCode : TLabel;
    edtCode : TEdit;

    HTTPRIOENSzBrigade: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    pcSzBrigade: TPageControl;
    tsGeneral: TTabSheet;
    tsIssueSZ: TTabSheet;
    lblNazv: TLabel;
    lblCeh_nazv: TLabel;
    edtNazv: TEdit;
    edtCeh_nazv: TEdit;
    lblMain_podr_nazv: TLabel;
    edtMain_podr_nazv: TEdit;
    lblSizCode: TLabel;
    edtSizCode: TEdit;
    edtPodrId: TEdit;
    lblPodrId: TLabel;
    lblCehId: TLabel;
    edtCehId: TEdit;
    lblQuantity: TLabel;
    edtQuantity: TEdit;
    lblENElementElementName: TLabel;
    edtENElementElementName: TEdit;
    spbENElementElement: TSpeedButton;
    lblMolCode: TLabel;
    edtMolCode: TEdit;
    spbPlanMOLMaster: TSpeedButton;
    lblMolName: TLabel;
    edtMolName: TEdit;
    lblSizNorm: TLabel;
    sgTKMaterials: TAdvStringGrid;
    HTTPRIOTKMaterials: THTTPRIO;
    HTTPRIOTKTechCard: THTTPRIO;
    tsPlans: TTabSheet;
    sgENPlanWork: TAdvStringGrid;
    HTTPRIOENPlanWork: THTTPRIO;
    sgIssue: TAdvStringGrid;
    tsWriteOffSz: TTabSheet;
    sgWriteOffSz: TAdvStringGrid;
    spbENDepartment: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;
    lblStatus: TLabel;
    edtStatus: TComboBox;
    pnlLegend: TPanel;
    Shape1: TShape;
    Label2: TLabel;
    ppIssue: TPopupMenu;
    miWriteOffOnlyEnergyNET: TMenuItem;
    actIssue: TActionList;
    actWriteOffOnlyEnergyNET: TAction;
    HTTPRIOENEstimateItem: THTTPRIO;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
    procedure spbPlanMOLMasterClick(Sender: TObject);
    procedure pcSzBrigadeChange(Sender: TObject);
    procedure sgENPlanWorkDblClick(Sender: TObject);
    procedure spbENDepartmentClick(Sender: TObject);
    procedure WriteOffOnlyEnergyNET(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSzBrigadeEdit: TfrmENSzBrigadeEdit;
  ENSzBrigadeObj: ENSzBrigade;
  operationLastCount , operationLastRow , operationColCount: Integer;

    TKMaterialsHeaders : array [1..5] of String =
        ( 'Код'
          ,'Найменування'
          ,'Од.вим.'
          ,'Кількість нормативна'
          ,'Кількість фактична'
        );

        ENPlanWorkHeaders: array [1..18] of String =
        ( 'Код'
          ,'Об''єкт планування'
          ,'Інв. №'
          ,'РЕЗ та ЕМ'
          ,'Рік плану'
          ,'Місяць плану'
          ,'Дата початку робіт'
          //,'Початк. місяць та рік плану (до перенесення)'
          //,'Початк. місяць плану'
          ,'ПідВид робіт'
          ,'Тип акту'
          ,'Вид плану'
          ,'Статус'
          ,'Підрозділ'
          ,'БюджетоТримач'
          ,'Центр відповідальності'
          ,'Початк. місяць та рік плану (до перенесення)'
          //,'Дата складання плану'
          ,'Номер наряда'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

          SizIssueHeaders : array [1..8] of String =
        (  'код.док'
          , 'Наименование'
          , 'Номенклатурный'
          , 'ед.изм.'
          , 'Номер документа'
          , 'Дата документа'
          , 'Кол-во'
          , 'Партія'

        );


         SizWriteOffHeaders : array [1..7] of String =
        (  ''
          , 'Найменування'
          , 'Номенклатурний'
          , 'од.вим.'
          , 'Номер документа'
          , 'Дата документа'
          ,' Кількість'

        );

implementation

uses
  ShowENElement
  ,ENElementController
, FINMolController, ShowFINMol, ENDepartment2EPRenController, 
  ENDepartmentController, TKMaterialsController, TKTechCardController, 
  ENPlanWorkController, ENPlanWorkTypeController, ENConsts, DMReportsUnit,
  EditENPlanWork, ShowENDepartment, ShowENGeographicDepartment,
  ENGeographicDepartmentController;

{uses  
    EnergyproController, EnergyproController2, ENSzBrigadeController  ;
}
{$R *.dfm}



procedure TfrmENSzBrigadeEdit.FormShow(Sender: TObject);
var
  TempTKMaterials : TKMaterialsControllerSoapPort;
  TempTKTechCard : TKTechCardControllerSoapPort;
  TKMaterialsList : TKMaterialsShortList;
  TKMaterials2List : TKMaterials2TechCardShortList;
  TKMaterialsFilterObj : TKMaterialsFilter;
  techCardCode, i : Integer;
  depShort : ENDepartmentShort;

  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
begin
  pcSzBrigade.ActivePage := tsGeneral;
  DisableControls([edtCeh_nazv]);
  edtNazv.SetFocus;
  lblCode.Visible := (DialogState <> dsInsert);
  edtCode.Visible := (DialogState <> dsInsert);

  if DialogState = dsView then
  begin
    DisableControls([edtENElementElementName, spbENElementElement,
      edtCode , edtMolCode , edtMolName ,spbPlanMOLMaster , edtGeograph , btnGeograph , btnGeographClear ]);
  end;

  if (DialogState = dsInsert) then
  begin
    tsPlans.TabVisible := False;
    tsIssueSZ.TabVisible := False;
    tsWriteOffSZ.TabVisible := False;
    edtStatus.ItemIndex := ENSZBRIGADE_WORKING;
    DisableControls([edtStatus]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtSizCode, edtCeh_nazv]);
    DisableControls([edtCode , edtMolCode , edtMolName , edtGeograph ]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ENSzBrigadeObj.element.geoDepartmentRef <> nil then
      if ENSzBrigadeObj.element.geoDepartmentRef.code <> LOW_INT then
       begin
              // geodept
            TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
          try
            ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENSzBrigadeObj.element.geoDepartmentRef.code );
            edtGeograph.Text := ENGeographicDepartmentObj.name;
          except
            on EConvertError do Exit;
          end;
       end;

    edtCode.Text := IntToStr(ENSzBrigadeObj.code);
    edtNazv.Text := ENSzBrigadeObj.nazv; 
    edtCeh_nazv.Text := ENSzBrigadeObj.ceh_nazv;
    edtMain_podr_nazv.Text := ENSzBrigadeObj.main_podr_nazv;
    if ( ENSzBrigadeObj.sizCode <> Low(Integer) ) then
       edtSizCode.Text := IntToStr(ENSzBrigadeObj.sizCode)
    else
       edtSizCode.Text := '';
    if ( ENSzBrigadeObj.podrId <> Low(Integer) ) then
       edtPodrId.Text := IntToStr(ENSzBrigadeObj.podrId)
    else
       edtPodrId.Text := '';
    if ( ENSzBrigadeObj.cehId <> Low(Integer) ) then
       edtCehId.Text := IntToStr(ENSzBrigadeObj.cehId)
    else
       edtCehId.Text := '';

    if ( ENSzBrigadeObj.quantity <> Low(Integer) ) then
       edtQuantity.Text := IntToStr(ENSzBrigadeObj.quantity)
    else
       edtQuantity.Text := '';

    //edtENElementElementName.Text := ENSzBrigadeObj.element.name;

    edtMolCode.Text := ENSzBrigadeObj.molCode; 
    edtMolName.Text := ENSzBrigadeObj.molName;

    edtStatus.ItemIndex := ENSzBrigadeObj.statusCode;
  end;

  SetFloatStyle([edtQuantity,edtSizCode,edtCehId,edtPodrId]);

  if (ENSzBrigadeObj.sizCode <> Low(Integer)) and ((DialogState = dsEdit) or (DialogState = dsView)) then
    begin
      SetGridHeaders(TKMaterialsHeaders, sgTKMaterials.ColumnHeaders);
      TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
      TempTKTechCard := HTTPRIOTKTechCard as TKTechCardControllerSoapPort;

      techCardCode := TempTKTechCard.getKartaBySiz(ENSzBrigadeObj.sizCode);
      //TKMaterials2List := TempTKMaterials.getMaterialsListByTechCardCode(techCardCode);
      TKMaterials2List := TempTKMaterials.getMaterialsBySzBrigade(techCardCode, ENSzBrigadeObj.code);

      operationLastCount:=High(TKMaterials2List.list);
      if operationLastCount > -1 then
         sgTKMaterials.RowCount:=operationLastCount+2
      else
         sgTKMaterials.RowCount:=2;

       with sgTKMaterials do
        for i:=0 to operationLastCount do
          begin
            Application.ProcessMessages;
            if TKMaterials2List.list[i].materialCode <> Low(Integer) then
            Cells[0,i+1] := IntToStr(TKMaterials2List.list[i].materialCode)
            else
            Cells[0,i+1] := '';
            Cells[1,i+1] := TKMaterials2List.list[i].name;
            Cells[2, i + 1] := TKMaterials2List.list[i].measurementName;

            if TKMaterials2List.list[i].countGen = nil then
              Cells[3,i+1] := ''
            else
              Cells[3,i+1] := TKMaterials2List.list[i].countGen.DecimalString;
           if TKMaterials2List.list[i].costnkre = nil then
              Cells[4,i+1] := ''
            else
              Cells[4,i+1] := TKMaterials2List.list[i].costnkre.DecimalString;


            


            operationLastRow :=i+1;
            sgTKMaterials.RowCount:= operationLastRow+1;
      end;
         operationColCount:=operationColCount+1;
         sgTKMaterials.Row:=1;
    end;

end;



procedure TfrmENSzBrigadeEdit.WriteOffOnlyEnergyNET(Sender: TObject);
var TempENEstimateItem: ENEstimateItemControllerSoapPort;
eiCode : Integer;
masterMOLCode:String;
ENEstimateItemObj: ENEstimateItem;
mol : FINMolShort;
begin
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    if sgIssue.Cells[0,sgIssue.Row] <> '' then
    begin
        try
          eiCode := StrToInt(sgIssue.Cells[0,sgIssue.Row]);
        except
        on EConvertError do Exit;
        end;


    end;

    mol := TfrmFINMolShow.chooseFromList();
    if(Assigned(mol)) then begin
            masterMOLCode := mol.id;
            //edtMol.Text := masterMOLCode + ' ' + selectedObj.text;
            ENEstimateItemObj := ENEstimateItem.Create;
            ENEstimateItemObj.code := eiCode;
            ENEstimateItemObj.countFact := TXSDecimal.Create;
            ENEstimateItemObj.countFact.DecimalString := sgIssue.Cells[6,sgIssue.Row];


            TempENEstimateItem.writeOffZZOnlyEnergyNETByBrigadeObject(ENEstimateItemObj ,  masterMOLCode   );
            Self.pcSzBrigadeChange(Sender);
    end;
end;

procedure TfrmENSzBrigadeEdit.btnGeographClearClick(Sender: TObject);
begin
  ENSzBrigadeObj.element.geoDepartmentRef.code := LOW_INT;
  edtGeograph.Text := '';
end;

procedure TfrmENSzBrigadeEdit.btnGeographClick(Sender: TObject);
var
   frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
   Filter : ENGeographicDepartmentFilter;
   selected : ENGeographicDepartmentShort;
begin
  Filter := ENGeographicDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);


  frmENGeographicDepartmentShow := TfrmENGeographicDepartmentShow.Create(Application, fmNormal, Filter);
  try
      with frmENGeographicDepartmentShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENGeographicDepartmentShort(sgENGeographicDepartment.Objects[0, sgENGeographicDepartment.Row]);
                except
                   on EConvertError do begin  Exit; end;
                end;
                 ENSzBrigadeObj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENSzBrigadeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSzBrigade: ENSzBrigadeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtSizCode, edtCeh_nazv
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSzBrigade := HTTPRIOENSzBrigade as ENSzBrigadeControllerSoapPort;

    ENSzBrigadeObj.nazv := edtNazv.Text;
    ENSzBrigadeObj.ceh_nazv := edtCeh_nazv.Text;
    ENSzBrigadeObj.main_podr_nazv := edtMain_podr_nazv.Text;

    if ( edtSizCode.Text <> '' ) then
      ENSzBrigadeObj.sizCode := StrToInt(edtSizCode.Text)
    else
      ENSzBrigadeObj.sizCode := Low(Integer) ;

     if ( edtPodrId.Text <> '' ) then
       ENSzBrigadeObj.podrId := StrToInt(edtPodrId.Text)
     else
       ENSzBrigadeObj.podrId := Low(Integer) ;

     if ( edtCehId.Text <> '' ) then
       ENSzBrigadeObj.cehId := StrToInt(edtCehId.Text)
     else
       ENSzBrigadeObj.cehId := Low(Integer) ;

     if ( edtQuantity.Text <> '' ) then
       ENSzBrigadeObj.quantity := StrToInt(edtQuantity.Text)
     else
       ENSzBrigadeObj.quantity := Low(Integer);

     ENSzBrigadeObj.molCode := edtMolCode.Text; 

     ENSzBrigadeObj.molName := edtMolName.Text;

     ENSzBrigadeObj.statusCode := edtStatus.ItemIndex;

    if DialogState = dsInsert then
    begin
      ENSzBrigadeObj.code:=low(Integer);
      TempENSzBrigade.add(ENSzBrigadeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSzBrigade.save(ENSzBrigadeObj);
    end;
  end;
end;


procedure TfrmENSzBrigadeEdit.spbENDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
   TempENDepartment: ENDepartmentControllerSoapPort;

begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   //f.typeRef := ENDepartmentTypeRef.Create;
   //f.typeRef.code := 0; // предприятие ХОЕ ... ENDEPARTMENTTYPE_DEPARTMENT;
   //f.conditionSQL := ' parentrefcode is null';
   //f.conditionSQL :=

   {
   f.code := 1;
   if ENPlanWorkFilterObj.elementRef <> nil then
      if ENPlanWorkFilterObj.elementRef.code > low(Integer) then
         if ENPlanWorkFilterObj.renRef <> nil then
            if ENPlanWorkFilterObj.renRef.code > low(Integer) then
            begin
               f.conditionSQL := 'code in (select departmentrefcode from endepartment2epren where renrefcode = ' + IntToStr(ENPlanWorkFilterObj.renRef.code) +')';
               f.code := Low(integer);
            end;

   }



   f.code := 1;


   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               TempENDepartment := Self.HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
               if ENSzBrigadeObj.departmentRef = nil then ENSzBrigadeObj.departmentRef := ENDepartmentRef.Create;
               ENSzBrigadeObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtCeh_nazv.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENSzBrigadeEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSzBrigadeObj.element = nil then ENSzBrigadeObj.element := ENElement.Create();
               ENSzBrigadeObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;

procedure TfrmENSzBrigadeEdit.spbPlanMOLMasterClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

  TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;

  molSel : boolean;
  // TempENDepartment: ENDepartmentControllerSoapPort;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

      // РЭСы и МОЛы

    if  ENSzBrigadeObj.cehId <> Low(Integer) then
     begin
       //  TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code := ENSzBrigadeObj.cehId;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               ENSzBrigadeObj.molCode := GetReturnValue(sgFINMol,0);
               ENSzBrigadeObj.molName := GetReturnValue(sgFINMol,1);

               edtMolCode.Text :=  GetReturnValue(sgFINMol,0);
               edtMolName.Text := GetReturnValue(sgFINMol,1);


            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;


end;

procedure TfrmENSzBrigadeEdit.pcSzBrigadeChange(Sender: TObject);

var
 ColCount , LastCount  , LastRow: Integer;
   TempENPlanWork: ENPlanWorkControllerSoapPort;
  i, n, techCardCode : Integer;
  ENPlanWorkList: ENPlanWorkShortList;
  plFilter : ENPlanWorkFilter;
  TempTKMaterials : TKMaterialsControllerSoapPort;
  TKIssue2List : TKMaterials2TechCardShortList;
begin
  if pcSzBrigade.ActivePage = tsPlans then
    begin
       SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
      ColCount:=100;
      TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

      plFilter := ENPlanWorkFilter.Create;
      SetNullIntProps(plFilter);
      SetNullXSProps(plFilter);
      plFilter.elementRef := ENElementRef.Create;
      plFilter.elementRef.code := ENSzBrigadeObj.element.code;
      plFilter.typeRef := ENPlanWorkTypeRef.Create;
      plFilter.typeRef.code :=  ENPLANWORKTYPE_SIZ;


      ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(ENPlanWorkFilter(plFilter),0,ColCount);

     try

      LastCount := High(ENPlanWorkList.list);

      if LastCount > -1 then
         sgENPlanWork.RowCount:=LastCount+2
      else
         sgENPlanWork.RowCount:=2;

       with sgENPlanWork do
        for i:=0 to LastCount do
          begin
            Application.ProcessMessages;

            n := 0;

            if ENPlanWorkList.list[i].code <> Low(Integer) then
            Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].code)
            else
            Cells[n,i+1] := '';
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].objectName;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].invNumber;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].renRefName;
            inc(n);

            if ENPlanWorkList.list[i].yearGen <> Low(Integer) then
              Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].yearGen)
            else
              Cells[n,i+1] := '';
            inc(n);

            if ENPlanWorkList.list[i].monthGen <> Low(Integer) then
              Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthGen]
            else
              Cells[n,i+1] := '';
            inc(n);

            if ENPlanWorkList.list[i].dateStart = nil then
              Cells[n,i+1] := ''
            else
              Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateStart);
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].typeRefName;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].stateRefShortName;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].kindName ;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].statusName;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].departmentRefShortName;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].budgetRefShortName;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].responsibilityRefShortName;
            inc(n);

            Cells[n,i+1] := '';

            if ENPlanWorkList.list[i].yearOriginal > 0 then
            begin
              if ENPlanWorkList.list[i].monthOriginal > 0 then
                Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthOriginal] + ' ' +
                                IntToStr(ENPlanWorkList.list[i].yearOriginal);
            end
            else
              Cells[n,i+1] := '';
            inc(n);
            /////

            Cells[n,i+1] := ENPlanWorkList.list[i].workOrderNumber;
            inc(n);

            Cells[n,i+1] := ENPlanWorkList.list[i].userGen;
            inc(n);

            if ENPlanWorkList.list[i].dateEdit = nil then
              Cells[n,i+1] := ''
            else
              Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateEdit);
            inc(n);

            LastRow:=i+1;
            sgENPlanWork.RowCount:=LastRow+1;
          end;

       ColCount:=ColCount+1;
       sgENPlanWork.Row:=1;
     finally
      ENPlanWorkList.Free;
     end;
    end;

     if pcSzBrigade.ActivePage = tsIssueSZ then
    begin
      SetGridHeaders(SizIssueHeaders, sgIssue.ColumnHeaders);
      TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;

      TKIssue2List := TempTKMaterials.getIssueByBrigadeObject(techCardCode, ENSzBrigadeObj.element.code);


      operationLastCount:=High(TKIssue2List.list);
      if operationLastCount > -1 then
         sgIssue.RowCount:=operationLastCount+2
      else
         sgIssue.RowCount:=2;

       with sgIssue do
        for i:=0 to operationLastCount do
          begin
            Application.ProcessMessages;

            if TKIssue2List.list[i].estimateItemCode <> Low(Integer) then
            Cells[0,i+1] := IntToStr(TKIssue2List.list[i].estimateItemCode)
            else
            Cells[0,i+1] := '';

            Cells[1,i+1] := TKIssue2List.list[i].identid;
            Cells[2,i+1] := TKIssue2List.list[i].accountingTypeRefName;
            Cells[3,i+1] := TKIssue2List.list[i].axMaterialsRefName;
            Cells[4,i+1] := TKIssue2List.list[i].axMaterialsRefStatus;
            Cells[5,i+1] := TKIssue2List.list[i].elementName;

            if TKIssue2List.list[i].countGen = nil then
              Cells[6,i+1] := ''
            else
              Cells[6,i+1] := TKIssue2List.list[i].countGen.DecimalString;

              Cells[7,i+1] := TKIssue2List.list[i].party_id;

            if TKIssue2List.list[i].isWrittenOff > 0 then
               sgIssue.RowColor[i + 1] := clRed
            else
               sgIssue.RowColor[i + 1] := clNone;



            operationLastRow :=i+1;
            sgIssue.RowCount:= operationLastRow+1;
          end;
         operationColCount:=operationColCount+1;
         sgIssue.Row:=1;

    end;

    if pcSzBrigade.ActivePage = tsWriteOffSz then
    begin
      SetGridHeaders(SizWriteOffHeaders, sgWriteOffSz.ColumnHeaders);
      TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;

      TKIssue2List := TempTKMaterials.getWriteOffBySubstation150Object(ENSzBrigadeObj.element.code);


      operationLastCount:=High(TKIssue2List.list);
      if operationLastCount > -1 then
         sgIssue.RowCount:=operationLastCount+2
      else
         sgIssue.RowCount:=2;

       with sgWriteOffSz do
        for i:=0 to operationLastCount do
          begin
            Application.ProcessMessages;

            Cells[1,i+1] := TKIssue2List.list[i].identid;
            Cells[2,i+1] := TKIssue2List.list[i].accountingTypeRefName;
            Cells[3,i+1] := TKIssue2List.list[i].axMaterialsRefName;
            Cells[4,i+1] := TKIssue2List.list[i].axMaterialsRefStatus;
            Cells[5,i+1] := TKIssue2List.list[i].elementName;

            if TKIssue2List.list[i].countGen = nil then
              Cells[6,i+1] := ''
            else
              Cells[6,i+1] := TKIssue2List.list[i].countGen.DecimalString;                       




            operationLastRow :=i+1;
            sgIssue.RowCount:= operationLastRow+1;
          end;
         operationColCount:=operationColCount+1;
         sgIssue.Row:=1;

    end;

end;

procedure TfrmENSzBrigadeEdit.sgENPlanWorkDblClick(Sender: TObject);
var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;
objCode , selectedRow : Integer;

begin
   try
      objCode:=StrToInt( sgENPlanWork.Cells[0, sgENPlanWork.row] );
     except
      on EConvertError do Exit;
   end;

   tPlan := DMReports.getPlanByCode( objCode );

   if tPlan = nil then
   begin
       exit;
   end;

   TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

   selectedRow := sgENPlanWork.Row;

   frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);

   if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT) and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
    frmENPlanWorkEdit.isTransport := true;

   if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
    frmENPlanWorkEdit.isSiz := true;

   try

     try
       frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject( objCode );
     except
       on EConvertError do Exit;
     end;

     frmENPlanWorkEdit.ShowModal;

   finally
     frmENPlanWorkEdit.Free;
     frmENPlanWorkEdit:=nil;
   end;
end;

end.
