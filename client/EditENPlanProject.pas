
unit EditENPlanProject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanProjectController,
  ShowTKProjectWork, TKProjectWorkController, ExtCtrls, AdvObj,
  ENPlanProjectTemplateController, ENPlanWorkController, CCNodeExtController,
  EditCCNodeFilter, ShowCCNode, CCNodeController, CCTowerController,
  CCFeederController, ENPlanProjectCalculationController,
  EditENPlanProjectCalculation, ShowTKProjectWorkCalculation, ENConsts,
  ListENPlanProjectCalculation, TKProjectWorkCalculationController ;

type
  TfrmENPlanProjectEdit = class(TDialogForm)
    lblProjectCipher : TLabel;
    edtProjectCipher: TEdit;
    lblProjectName : TLabel;
    edtProjectName: TEdit;


  HTTPRIOENPlanProject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbtkprojectwork: TSpeedButton;
    lbltkprojectwork: TLabel;
    edttkprojectwork: TEdit;
    Panel3: TPanel;
    Panel1: TPanel;
    HTTPRIOENPlanProjectTemplate: THTTPRIO;
    Splitter1: TSplitter;
    Panel2: TPanel;
    grpCCNodeTree: TGroupBox;
    MainTree: TTreeView;
    gbButtons: TGroupBox;
    btnSearchInTree: TButton;
    btnShowSO2NodesChild: TButton;
    HTTPRIOCCNode: THTTPRIO;
    HTTPRIOCCNodeExt: THTTPRIO;
    Splitter2: TSplitter;
    GroupBox1: TGroupBox;
    sgCCTower: TAdvStringGrid;
    HTTPRIOCCTower: THTTPRIO;
    GroupBox2: TGroupBox;
    Button2: TButton;
    GroupBox3: TGroupBox;
    sgENPlanProjectTemplate: TAdvStringGrid;
    Splitter3: TSplitter;
    ActionList1: TActionList;
    actView: TAction;
    actInsertProjectCalculation: TAction;
    actDeleteProjectCalculationExecut: TAction;
    actEdit: TAction;
    actUpdateProjectCalculation: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    ImageList1: TImageList;
    HTTPRIOTKProjectWorkCalculation: THTTPRIO;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    GroupBox4: TGroupBox;
    ToolBar1: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    HTTPRIOENPlanProjectCalculation: THTTPRIO;
    sgTKProjectWorkCalculation: TAdvStringGrid;
    HTTPRIOTKProjectWork: THTTPRIO;
    lblEPVoltageNominalName: TLabel;
    edtEPVoltageNominalName: TEdit;
    spbEPVoltageNominal: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbtkprojectworkClick(Sender: TObject);
  procedure updateENPlanProjectTemplate(Sender: TObject);
  procedure UpdateMainTreeTop();
  procedure btnSearchInTreeClick(Sender: TObject);
  procedure ShowNodeInTree(NodeCode: Integer);
  procedure UpdateMainTreeBranch(parentNode: TTreeNode);
  procedure updateCCtowerBySelectedNode;
    procedure MainTreeClick(Sender: TObject);
    procedure MainTreeExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure btnShowSO2NodesChildClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure actInsertProjectCalculationExecute(Sender: TObject);
    procedure actUpdateProjectCalculationExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actDeleteProjectCalculationExecutExecute(Sender: TObject);
    procedure spbEPVoltageNominalClick(Sender: TObject);
  
  private
    { Private declarations }
    selectedRowProjectCalculation : Integer;
    sgENPlanProjectCalculationLastRow : Integer;
    codesCalculation : String;
  public
    { Public declarations }

end;

var
  frmENPlanProjectEdit: TfrmENPlanProjectEdit;
  ENPlanProjectObj: ENPlanProject;

implementation

uses ShowENPlanWorkState, ShowEPVoltageNominal;


{uses  
    EnergyproController, EnergyproController2, ENPlanProjectController  ;
}
{$R *.dfm}


 var
 ENPlanProjectTemplateHeaders: array [1..6] of String =
        ( 'Код'
          ,'тэг'
          ,'назва елементу мережі або опори'
          ,'код елементу мережі або опори'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );

 ENPlanProjectCalculationHeaders: array [1..2] of String =
        ( 'Код' , 'Розрахунок'
        );

 TKProjectWorkCalculationHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування'
        );

procedure TfrmENPlanProjectEdit.FormShow(Sender: TObject);
 var
 TempENPlanProject: ENPlanProjectControllerSoapPort;
 i, ii , jj , LastCount , LastRow : Integer;
 tempTKProjectWorkCalculationFilter : TKProjectWorkCalculationFilter;
 TempTKProjectWorkCalculation: TKProjectWorkCalculationControllerSoapPort;
 TKProjectWorkCalculationList: TKProjectWorkCalculationShortList;

 TempTKProjectWork: TKProjectWorkControllerSoapPort;
  iii: Integer;
 TKProjectWorkList: TKProjectWorkShortList;
 tempTKProjectWorkFilter: TKProjectWorkFilter;
begin
  codesCalculation:= '';

  DisableControls([edtEPVoltageNominalName,edtProjectCipher , edttkprojectwork]);


  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtProjectCipher
      ,edtProjectName

     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
     // edtCode.Text := IntToStr(ENPlanProjectObj.code);
    edtProjectCipher.Text := ENPlanProjectObj.projectCipher;
    edtProjectName.Text := ENPlanProjectObj.projectName; 
   // edtUserGen.Text := ENPlanProjectObj.userGen;
      //SetDateFieldForDateTimePicker(edtDateEdit, ENPlanProjectObj.dateEdit);
   if (ENPlanProjectObj.projectWorkRef.code <> LOW_INT) then
   begin

    TempTKProjectWork :=  HTTPRIOTKProjectWork as TKProjectWorkControllerSoapPort;
    tempTKProjectWorkFilter := TKProjectWorkFilter.Create;
    SetNullIntProps(tempTKProjectWorkFilter);
    SetNullXSProps(tempTKProjectWorkFilter);
    tempTKProjectWorkFilter.code := ENPlanProjectObj.projectWorkRef.code;

    TKProjectWorkList := TempTKProjectWork.getScrollableFilteredList(tempTKProjectWorkFilter,0,-1);
    if High(TKProjectWorkList.list) > -1 then
       edttkprojectwork.Text :=  TKProjectWorkList.list[0].name;
    if(ENPlanProjectObj.voltagenominal.value <> nil ) then
    edtEPVoltageNominalName.Text := ENPlanProjectObj.voltagenominal.value.DecimalString;
   end;


  end;

  if (DialogState = dsInsert) then
   begin
    TempENPlanProject := HTTPRIOENPlanProject as ENPlanProjectControllerSoapPort;
    edtProjectCipher.Text := TempENPlanProject.generatecipher(ENPlanProjectObj);
    DisableControls([ spbtkprojectwork ] , false );
    UpdateMainTreeTop;
    actUpdateProjectCalculationExecute(Sender);
   end
    else
    DisableControls([ spbtkprojectwork ]  );

    if(DialogState = dsView) then
     begin
       updateENPlanProjectTemplate(Sender);
       DisableControls([btnSearchInTree  , btnShowSO2NodesChild  ,  Button2  , spbEPVoltageNominal ]);
     end;

    
    //SetGridHeaders(ENPlanProjectCalculationHeaders, sgENPlanProjectCalculation.ColumnHeaders);
    SetGridHeaders(TKProjectWorkCalculationHeaders, sgTKProjectWorkCalculation.ColumnHeaders);
    
     if(DialogState = dsView) then
           begin
                  for ii:=1 to sgTKProjectWorkCalculation.RowCount-1 do
                     for jj:=0 to sgTKProjectWorkCalculation.ColCount-1 do
                       sgTKProjectWorkCalculation.Cells[jj,ii]:='';

                  tempTKProjectWorkCalculationFilter := TKProjectWorkCalculationFilter.Create;
                  SetNullIntProps(tempTKProjectWorkCalculationFilter);
                  SetNullXSProps(tempTKProjectWorkCalculationFilter);
                  tempTKProjectWorkCalculationFilter.conditionSQL := tempTKProjectWorkCalculationFilter.conditionSQL +
                  ' tkprojectworkcalculatn.code in (   select pcl.tkprojworkcalculatincd from enplanprojectcalculatn pcl ' +
                                                       ' where pcl.projectworkrefcode = '+ IntToStr(ENPlanProjectObj.code) + '  )';


                  TempTKProjectWorkCalculation :=  HTTPRIOTKProjectWorkCalculation as TKProjectWorkCalculationControllerSoapPort;
                  TKProjectWorkCalculationList := TempTKProjectWorkCalculation.getScrollableFilteredList(tempTKProjectWorkCalculationFilter,0,10000);
                  LastCount:=High(TKProjectWorkCalculationList.list);

                  if LastCount > -1 then
                     sgTKProjectWorkCalculation.RowCount:=LastCount+2
                  else
                     sgTKProjectWorkCalculation.RowCount:=2;

                   with sgTKProjectWorkCalculation do
                    for i:=0 to LastCount do
                      begin
                        Application.ProcessMessages;
                        if TKProjectWorkCalculationList.list[i].code <> Low(Integer) then
                        Cells[0,i+1] := IntToStr(TKProjectWorkCalculationList.list[i].code)
                        else
                        Cells[0,i+1] := '';

                        Cells[1,i+1] := TKProjectWorkCalculationList.list[i].name;
                        LastRow:=i+1;
                        sgTKProjectWorkCalculation.RowCount:=LastRow+1;
                      end;


                    sgTKProjectWorkCalculation.Row:=1;

           end;

    
end;



procedure TfrmENPlanProjectEdit.MainTreeClick(Sender: TObject);
begin
  inherited;
  updateCCtowerBySelectedNode;
end;

procedure TfrmENPlanProjectEdit.MainTreeExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
    UpdateMainTreeBranch(Node);
end;

procedure TfrmENPlanProjectEdit.spbEPVoltageNominalClick(Sender: TObject);
var
   frmEPVoltageNominalShow: TfrmEPVoltageNominalShow;
   EPVoltageNominalFilterObj: EPVoltageNominalFilter;
    TempENPlanProject: ENPlanProjectControllerSoapPort;
begin
   EPVoltageNominalFilterObj := EPVoltageNominalFilter.Create;
   SetNullIntProps(EPVoltageNominalFilterObj);
   SetNullXSProps(EPVoltageNominalFilterObj);
   //EPVoltageNominalFilterObj.conditionSQL := ' code in (1,2,3,4)';

   frmEPVoltageNominalShow:=TfrmEPVoltageNominalShow.Create(Application, fmNormal, EPVoltageNominalFilterObj);
   try
      with frmEPVoltageNominalShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPlanProjectObj.voltagenominal = nil then ENPlanProjectObj.voltagenominal := EPVoltageNominal.Create();
               ENPlanProjectObj.voltagenominal.code := StrToInt(GetReturnValue(sgMain,0));
               edtEPVoltageNominalName.Text:=GetReturnValue(sgMain,1);

               TempENPlanProject := HTTPRIOENPlanProject as ENPlanProjectControllerSoapPort;
               edtProjectCipher.Text := TempENPlanProject.generatecipher(ENPlanProjectObj);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPVoltageNominalShow.Free;
   end;
end;

procedure TfrmENPlanProjectEdit.spbtkprojectworkClick(Sender: TObject);
var
   frmTKProjectWorkShow: TfrmTKProjectWorkShow;
   f : TKProjectWorkFilter;
   TempENPlanProject: ENPlanProjectControllerSoapPort;
begin
   f:= TKProjectWorkFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   //f.conditionSQL := '';

   TempENPlanProject := HTTPRIOENPlanProject as ENPlanProjectControllerSoapPort;

   frmTKProjectWorkShow :=TfrmTKProjectWorkShow.Create(Application,fmNormal,f);
   try
      with frmTKProjectWorkShow do begin
        DisableActions([ actEdit, actInsert, actDelete, actNoFilter, actFilter ]);
        if ShowModal = mrOk then
        begin
            try
               if ENPlanProjectObj.projectWorkRef  = nil then
                  ENPlanProjectObj.projectWorkRef := TKProjectWorkRef .Create();
               ENPlanProjectObj.projectWorkRef.code := StrToInt(GetReturnValue(sgTKProjectWork,0));
               edttkprojectwork.Text:= GetReturnValue(sgTKProjectWork,1);

               TempENPlanProject.generateenplanprojecttemplate(ENPlanProjectObj);
               updateENPlanProjectTemplate(Sender);
               edtProjectName.Text := TempENPlanProject.generateprojectname(ENPlanProjectObj);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmTKProjectWorkShow.Free;
   end;

end;

procedure TfrmENPlanProjectEdit.actDeleteProjectCalculationExecutExecute(
  Sender: TObject);
Var TempENPlanProjectCalculation: ENPlanProjectCalculationControllerSoapPort;
  ObjCode, ii , jj , i , LastCounttkprojcalc , LastRowtkprojcalc: Integer;
  TempENPlanProjectCalculationFil: ENPlanProjectCalculationFilter;
  ENPlanProjectCalculationList: ENPlanProjectCalculationShortList;
  tempTKProjectWorkCalculationFilter : TKProjectWorkCalculationFilter;
  TempTKProjectWorkCalculation: TKProjectWorkCalculationControllerSoapPort;
  TKProjectWorkCalculationList: TKProjectWorkCalculationShortList;
begin
 TempENPlanProjectCalculation := HTTPRIOENPlanProjectCalculation as ENPlanProjectCalculationControllerSoapPort;
  TempENPlanProjectCalculationFil := ENPlanProjectCalculationFilter.Create;
  SetNullIntProps(TempENPlanProjectCalculationFil);
  SetNullXSProps(TempENPlanProjectCalculationFil);


  try
    TempENPlanProjectCalculationFil.projectWorkRef:= ENPlanProjectRef.Create;
    TempENPlanProjectCalculationFil.projectWorkRef.code:= ENPlanProjectObj.code;

    TempENPlanProjectCalculationFil.tkProjWorkCalculation := TKProjectWorkCalculation.Create;
    TempENPlanProjectCalculationFil.tkProjWorkCalculation.code := StrToInt(sgTKProjectWorkCalculation.Cells[0,sgTKProjectWorkCalculation.Row]);
     except
   on EConvertError do Exit;
  end;

  // zzzzz
  ENPlanProjectCalculationList := TempENPlanProjectCalculation.getScrollableFilteredList(TempENPlanProjectCalculationFil,0,-1);
  if High(ENPlanProjectCalculationList.list) > -1 then
     ObjCode:= ENPlanProjectCalculationList.list[0].code
  else
     Exit;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (Розрахунки в проекті) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanProjectCalculation.remove(ObjCode);


       begin
                  for ii:=1 to sgTKProjectWorkCalculation.RowCount-1 do
                     for jj:=0 to sgTKProjectWorkCalculation.ColCount-1 do
                       sgTKProjectWorkCalculation.Cells[jj,ii]:='';

                  tempTKProjectWorkCalculationFilter := TKProjectWorkCalculationFilter.Create;
                  SetNullIntProps(tempTKProjectWorkCalculationFilter);
                  SetNullXSProps(tempTKProjectWorkCalculationFilter);
                  tempTKProjectWorkCalculationFilter.conditionSQL := tempTKProjectWorkCalculationFilter.conditionSQL +
                  ' tkprojectworkcalculatn.code in (   select pcl.tkprojworkcalculatincd from enplanprojectcalculatn pcl ' +
                                                       ' where pcl.projectworkrefcode = '+ IntToStr(ENPlanProjectObj.code) + '  )';


                  TempTKProjectWorkCalculation :=  HTTPRIOTKProjectWorkCalculation as TKProjectWorkCalculationControllerSoapPort;
                  TKProjectWorkCalculationList := TempTKProjectWorkCalculation.getScrollableFilteredList(tempTKProjectWorkCalculationFilter,0,10000);
                  LastCounttkprojcalc:=High(TKProjectWorkCalculationList.list);

                  if LastCounttkprojcalc > -1 then
                     sgTKProjectWorkCalculation.RowCount:=LastCounttkprojcalc+2
                  else
                     sgTKProjectWorkCalculation.RowCount:=2;

                   with sgTKProjectWorkCalculation do
                    for i:=0 to LastCounttkprojcalc do
                      begin
                        Application.ProcessMessages;
                        if TKProjectWorkCalculationList.list[i].code <> Low(Integer) then
                        Cells[0,i+1] := IntToStr(TKProjectWorkCalculationList.list[i].code)
                        else
                        Cells[0,i+1] := '';

                        Cells[1,i+1] := TKProjectWorkCalculationList.list[i].name;
                        LastRowtkprojcalc:=i+1;
                        sgTKProjectWorkCalculation.RowCount:=LastRowtkprojcalc+1;
                      end;


                    sgTKProjectWorkCalculation.Row:=1;

           end;
  end;
end;

procedure TfrmENPlanProjectEdit.actInsertProjectCalculationExecute(Sender: TObject);
// Var TempENPlanProjectCalculation: ENPlanProjectCalculationControllerSoapPort;
var i  , ii, jj, tempENPlanProjectCalculationCount , LastCount , LastRow  : Integer;
 selTkCalculationItemForAdd2PlanProject : Boolean;
 tempENPlanProjectCalculationShort : ENPlanProjectCalculationShort;
 tempENPlanProjectCalculationArr : ArrayOfENPlanProjectCalculationShort;
 tempENPlanProjectCalculationShortList : ENPlanProjectCalculationShortList;
 ENPlanProjectCalculationObj:ENPlanProjectCalculation;

 TempENPlanProjectCalculation : ENPlanProjectCalculationControllerSoapPort;


 tempEnProjectWorkCalculationFilter : ENPlanProjectCalculationFilter;

 tempTKProjectWorkCalculationFilter : TKProjectWorkCalculationFilter;
 TempTKProjectWorkCalculation: TKProjectWorkCalculationControllerSoapPort;
 TKProjectWorkCalculationList: TKProjectWorkCalculationShortList;
begin



    frmENPlanProjectCalculationList := TfrmENPlanProjectCalculationList.Create(Application,dsEdit );
    frmENPlanProjectCalculationList.plancode:= ENPlanProjectObj.planRef.code;
  try

      with frmENPlanProjectCalculationList do begin
      if ShowModal = mrOk then


        For i:=0 to ListTKProjectCalculation.Count -1  do
          Begin
             if  ListTKProjectCalculation.Checked[i] then
             begin
               if codesCalculation = '' then
               codesCalculation:= IntToStr(  Integer( ListTKProjectCalculation.Items.Objects[i] ) )
               else
               codesCalculation:= codesCalculation + ',' + IntToStr(  Integer( ListTKProjectCalculation.Items.Objects[i] ) );

               //
               if ENPlanProjectObj.code <> LOW_INT then
               begin
                TempENPlanProjectCalculation :=  HTTPRIOENPlanProjectCalculation as ENPlanProjectCalculationControllerSoapPort;
                ENPlanProjectCalculationObj:=ENPlanProjectCalculation.Create;
                SetNullIntProps(ENPlanProjectCalculationObj);
                SetNullXSProps(ENPlanProjectCalculationObj);

                if ENPlanProjectCalculationObj.tkProjWorkCalculation = nil then ENPlanProjectCalculationObj.tkProjWorkCalculation := TKProjectWorkCalculation.Create();
                ENPlanProjectCalculationObj.tkProjWorkCalculation.code := Integer( ListTKProjectCalculation.Items.Objects[i] );

                if ENPlanProjectCalculationObj.projectWorkRef = nil then  ENPlanProjectCalculationObj.projectWorkRef := ENPlanProjectRef.Create;
                ENPlanProjectCalculationObj.projectWorkRef.code := ENPlanProjectObj.code;

                TempENPlanProjectCalculation.add( ENPlanProjectCalculationObj  );
               end;

              
             end;
          End;

             
        end;
           if codesCalculation <> '' then
           begin
                  for ii:=1 to sgTKProjectWorkCalculation.RowCount-1 do
                     for jj:=0 to sgTKProjectWorkCalculation.ColCount-1 do
                       sgTKProjectWorkCalculation.Cells[jj,ii]:='';

                  tempTKProjectWorkCalculationFilter := TKProjectWorkCalculationFilter.Create;
                  SetNullIntProps(tempTKProjectWorkCalculationFilter);
                  SetNullXSProps(tempTKProjectWorkCalculationFilter);
                  tempTKProjectWorkCalculationFilter.conditionSQL := ' tkprojectworkcalculatn.code in (' +  codesCalculation + ')';
                  //
                  if ENPlanProjectObj.code <> LOW_INT then
                  tempTKProjectWorkCalculationFilter.conditionSQL := tempTKProjectWorkCalculationFilter.conditionSQL +
                  ' or  tkprojectworkcalculatn.code in (   select pcl.tkprojworkcalculatincd from enplanprojectcalculatn pcl ' +
                                                       ' where pcl.projectworkrefcode = '+ IntToStr(ENPlanProjectObj.code) + '  )';


                  TempTKProjectWorkCalculation :=  HTTPRIOTKProjectWorkCalculation as TKProjectWorkCalculationControllerSoapPort;
                  TKProjectWorkCalculationList := TempTKProjectWorkCalculation.getScrollableFilteredList(tempTKProjectWorkCalculationFilter,0,10000);
                  LastCount:=High(TKProjectWorkCalculationList.list);

                  if LastCount > -1 then
                     sgTKProjectWorkCalculation.RowCount:=LastCount+2
                  else
                     sgTKProjectWorkCalculation.RowCount:=2;

                   with sgTKProjectWorkCalculation do
                    for i:=0 to LastCount do
                      begin
                        Application.ProcessMessages;
                        if TKProjectWorkCalculationList.list[i].code <> Low(Integer) then
                        Cells[0,i+1] := IntToStr(TKProjectWorkCalculationList.list[i].code)
                        else
                        Cells[0,i+1] := '';

                        Cells[1,i+1] := TKProjectWorkCalculationList.list[i].name;
                        LastRow:=i+1;
                        sgTKProjectWorkCalculation.RowCount:=LastRow+1;
                      end;


                    sgTKProjectWorkCalculation.Row:=1;

           end;


  finally
    frmENPlanProjectCalculationList.Free;
 end;



  {ENPlanProjectCalculationObj:=ENPlanProjectCalculation.Create;
  SetNullIntProps(ENPlanProjectCalculationObj);
  SetNullXSProps(ENPlanProjectCalculationObj);

  ENPlanProjectCalculationObj.projectWorkRef := ENPlanProjectRef.Create;
  ENPlanProjectCalculationObj.projectWorkRef.code := ENPlanProjectObj.code;

  frmTKProjectWorkCalculationShow:=TfrmTKProjectWorkCalculationShow.Create(Application,fmNormal);
   try
      with frmTKProjectWorkCalculationShow do
        if ShowModal = mrOk then
        begin
            try
            selTkCalculationItemForAdd2PlanProject := false;
            for i := 1 to sgTKProjectWorkCalculation.RowCount - 1 do
              begin
                sgTKProjectWorkCalculation.GetCheckBoxState(1, i, selTkCalculationItemForAdd2PlanProject);
                if selTkCalculationItemForAdd2PlanProject then
                begin
                   tempENPlanProjectCalculationShort := ENPlanProjectCalculationShort.Create;
                   SetNullIntProps(tempENPlanProjectCalculationShort);
                   SetNullXSProps(tempENPlanProjectCalculationShort);
                   tempENPlanProjectCalculationShort.code :=  LOW_INT;
                   tempENPlanProjectCalculationShort.projectWorkRefCode := ENPlanProjectObj.code;
                   tempENPlanProjectCalculationShort.tkProjWorkCalculationCode := StrToInt(GetReturnValue(sgTKProjectWorkCalculation,0));

                   tempENPlanProjectCalculationCount := High(tempENPlanProjectCalculationArr) + 1;
                   SetLength(tempENPlanProjectCalculationArr, tempENPlanProjectCalculationCount + 1);
                   tempENPlanProjectCalculationArr[tempENPlanProjectCalculationCount] := tempENPlanProjectCalculationShort;

                end;
              end;

              tempENPlanProjectCalculationShortList := ENPlanProjectCalculationShortList.Create;
              tempENPlanProjectCalculationShortList.totalCount:= 0;

              tempENPlanProjectCalculationShortList.list:= tempENPlanProjectCalculationArr;
              tempENPlanProjectCalculationShortList.totalCount := High(tempENPlanProjectCalculationArr) + 1;

              if (tempENPlanProjectCalculationShortList.totalCount >= 0  ) then
              begin
                TempENPlanProjectCalculation :=  HTTPRIOENPlanProjectCalculation as ENPlanProjectCalculationControllerSoapPort;
                TempENPlanProjectCalculation.addCalculationList( tempENPlanProjectCalculationShortList  );

                actUpdateProjectCalculationExecute(Sender);
              end
              else begin
                Application.MessageBox(PChar('Не вибрано жодного розрахунку!'), PChar('Увага!'), MB_ICONWARNING);
                Exit;
              end;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKProjectWorkCalculationShow.Free;
   end;  }
end;


procedure TfrmENPlanProjectEdit.actUpdateProjectCalculationExecute(Sender: TObject);
var
  TempENPlanProjectCalculation: ENPlanProjectCalculationControllerSoapPort;
  i , j, ColCount , LastCount  : Integer;
  ENPlanProjectCalculationList: ENPlanProjectCalculationShortList;
  TempENPlanProjectCalculationFilter : ENPlanProjectCalculationFilter;
begin
  {for i:=1 to sgENPlanProjectCalculation.RowCount-1 do
   for j:=0 to sgENPlanProjectCalculation.ColCount-1 do
     sgENPlanProjectCalculation.Cells[j,i]:='';
  ColCount:=10000;
  TempENPlanProjectCalculation :=  HTTPRIOENPlanProjectCalculation as ENPlanProjectCalculationControllerSoapPort;


  TempENPlanProjectCalculationFilter := ENPlanProjectCalculationFilter.Create;
  SetNullIntProps(TempENPlanProjectCalculationFilter);
  SetNullXSProps(TempENPlanProjectCalculationFilter);

  TempENPlanProjectCalculationFilter.projectWorkRef:= ENPlanProjectRef.Create;
  TempENPlanProjectCalculationFilter.projectWorkRef.code := ENPlanProjectObj.code;

  ENPlanProjectCalculationList := TempENPlanProjectCalculation.getScrollableFilteredList(TempENPlanProjectCalculationFilter,0,ColCount);
  LastCount:=High(ENPlanProjectCalculationList.list);

  if LastCount > -1 then
     sgENPlanProjectCalculation.RowCount:=LastCount+2
  else
     sgENPlanProjectCalculation.RowCount:=2;

   with sgENPlanProjectCalculation do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanProjectCalculationList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanProjectCalculationList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPlanProjectCalculationList.list[i].tkProjWorkCalculationName;
        sgENPlanProjectCalculationLastRow:=i+1;
        sgENPlanProjectCalculation.RowCount:=sgENPlanProjectCalculationLastRow+1;
      end;

    ColCount:=ColCount+1;
    sgENPlanProjectCalculation.Row:=1;

    if selectedRowProjectCalculation <> 0 then
    begin
    if sgENPlanProjectCalculation.RowCount > selectedRowProjectCalculation then
      sgENPlanProjectCalculation.Row := selectedRowProjectCalculation
    else
      sgENPlanProjectCalculation.Row := sgENPlanProjectCalculation.RowCount - 1;
    end
    else
      sgENPlanProjectCalculation.Row:=1;     }
end;

procedure TfrmENPlanProjectEdit.btnSearchInTreeClick(Sender: TObject);
var
  frmCCNodeFilterEdit: TfrmCCNodeFilterEdit;
  frmCCNodeShow: TfrmCCNodeShow;
  i: Integer;
  NodeObj: CCNode;
  TempCCNode: CCNodeControllerSoapPort;
begin
    frmCCNodeFilterEdit := TfrmCCNodeFilterEdit.Create(Application, dsInsert);

    try
      if frmCCNodeFilterEdit.ShowModal <> mrOk then exit
    finally
      frmCCNodeFilterEdit.Free;
      frmCCNodeFilterEdit := nil;
    end;

   frmCCNodeShow:=TfrmCCNodeShow.Create(Application,fmNormal,CCNodeFilterObj);
   TempCCNode:=HTTPRIOCCNode as CCNodeControllerSoapPort;
   try
      with frmCCNodeShow do
      begin
           i:= ShowModal;

           if i = mrOk then
           begin
             try
               NodeObj:=TempCCNode.getObject(StrToInt(GetReturnValue(sgCCNode,0)));
             except
               on EConvertError do Exit;
             end;
           end
             else Exit;
      end;
    finally
      frmCCNodeShow.Free;
   end;

   if NodeObj=nil then Exit;

   ShowNodeInTree(NodeObj.code);
   //updateSO2NodeBySelectedNode;
end;

procedure TfrmENPlanProjectEdit.btnShowSO2NodesChildClick(Sender: TObject);
var
  intCodesList: CCNodeExtController.ArrayOfInteger;
  i : Integer;
  TempCCNodeExt: CCNodeExtControllerSoapPort;
  strCodesList: String;
  TempENPlanProject: ENPlanProjectControllerSoapPort;
  TempENPlanProjectTemplate: ENPlanProjectTemplateControllerSoapPort;
  tmplObj: ENPlanProjectTemplate;
begin
  if MainTree.Selected = nil then
  begin
        ShowMessage('Не обрано елемент мережі з дерева об''єктів CallCentre');
        exit;
  end;
  TempCCNodeExt:= HTTPRIOCCNodeExt as  CCNodeExtControllerSoapPort;

  if ( (  sgENPlanProjectTemplate.Cells[1, sgENPlanProjectTemplate.Row] = '<ES>' )
      or (  sgENPlanProjectTemplate.Cells[1, sgENPlanProjectTemplate.Row] = '<ES1>' )
     ) then
     begin
       TempENPlanProjectTemplate := HTTPRIOENPlanProjectTemplate as ENPlanProjectTemplateControllerSoapPort;
       TempENPlanProject := HTTPRIOENPlanProject as ENPlanProjectControllerSoapPort;
       sgENPlanProjectTemplate.Cells[2, sgENPlanProjectTemplate.Row] := CCNodeExtShort(MainTree.Selected.Data).name;
       sgENPlanProjectTemplate.Cells[3, sgENPlanProjectTemplate.Row] := IntToStr(CCNodeExtShort(MainTree.Selected.Data).code);


       try
          tmplObj := TempENPlanProjectTemplate.getObject(StrToInt(sgENPlanProjectTemplate.Cells[0,sgENPlanProjectTemplate.Row]));
          tmplObj.elementName := CCNodeExtShort(MainTree.Selected.Data).name;
          tmplObj.elementcode := CCNodeExtShort(MainTree.Selected.Data).code;
          TempENPlanProjectTemplate.save(tmplObj);
          edtProjectName.Text := TempENPlanProject.generateprojectname(ENPlanProjectObj);
        except
          on EConvertError do Exit;
        end;
     end;
//  intCodesList := TempCCNodeExt.getChildNodesCodeArray(CCNodeExtShort(MainTree.Selected.Data).code);
//    for i:=0 to High(intCodesList) do
//    begin
//        if strCodesList <> '' then strCodesList := strCodesList + ', ';
//        strCodesList := strCodesList + IntToStr(intCodesList[i]);
//    end;

end;

procedure TfrmENPlanProjectEdit.Button2Click(Sender: TObject);
var
TempENPlanProject: ENPlanProjectControllerSoapPort;
TempENPlanProjectTemplate: ENPlanProjectTemplateControllerSoapPort;
  tmplObj: ENPlanProjectTemplate;
begin



  if ( (  sgENPlanProjectTemplate.Cells[1, sgENPlanProjectTemplate.Row] = '<OP>' )
   or (  sgENPlanProjectTemplate.Cells[1, sgENPlanProjectTemplate.Row] = '<OP1>' )
     ) then
     begin
       sgENPlanProjectTemplate.Cells[2, sgENPlanProjectTemplate.Row] := sgCCTower.Cells[1, sgCCTower.Row];
       sgENPlanProjectTemplate.Cells[3, sgENPlanProjectTemplate.Row] := sgCCTower.Cells[0, sgCCTower.Row];

       TempENPlanProject := HTTPRIOENPlanProject as ENPlanProjectControllerSoapPort;
       //edtProjectName.Text := TempENPlanProject.generateprojectname(ENPlanProjectObj);

       try
          TempENPlanProjectTemplate := HTTPRIOENPlanProjectTemplate as ENPlanProjectTemplateControllerSoapPort;
          tmplObj := TempENPlanProjectTemplate.getObject(StrToInt(sgENPlanProjectTemplate.Cells[0,sgENPlanProjectTemplate.Row]));
          tmplObj.elementName := sgCCTower.Cells[1, sgCCTower.Row];
          tmplObj.elementcode := StrToInt(sgCCTower.Cells[0, sgCCTower.Row]);
          TempENPlanProjectTemplate.save(tmplObj);
          edtProjectName.Text := TempENPlanProject.generateprojectname(ENPlanProjectObj);
        except
          on EConvertError do Exit;
        end;
     end;

end;

procedure TfrmENPlanProjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanProject: ENPlanProjectControllerSoapPort;
newENPlanProjectCode , i : Integer;

tempTKProjectWorkCalculationFilter : TKProjectWorkCalculationFilter;
TempTKProjectWorkCalculation: TKProjectWorkCalculationControllerSoapPort;
TKProjectWorkCalculationList: TKProjectWorkCalculationShortList;
 TempENPlanProjectCalculation : ENPlanProjectCalculationControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtProjectCipher
      ,edtProjectName
      ,edtEPVoltageNominalName
      ,edttkprojectwork
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENPlanProject := HTTPRIOENPlanProject as ENPlanProjectControllerSoapPort;


     ENPlanProjectObj.projectCipher := edtProjectCipher.Text; 

     ENPlanProjectObj.projectName := edtProjectName.Text; 

    // ENPlanProjectObj.userGen := edtUserGen.Text;

     //ENPlanProjectObj.dateEdit := GetTXSDateTimeFromTDateTimePicker(edtdateEdit);

    if DialogState = dsInsert then
    begin
      ENPlanProjectObj.code:=low(Integer);
      newENPlanProjectCode := TempENPlanProject.add(ENPlanProjectObj);

      if codesCalculation <> '' then
      begin

            tempTKProjectWorkCalculationFilter := TKProjectWorkCalculationFilter.Create;
            SetNullIntProps(tempTKProjectWorkCalculationFilter);
            SetNullXSProps(tempTKProjectWorkCalculationFilter);
            tempTKProjectWorkCalculationFilter.conditionSQL := ' tkprojectworkcalculatn.code in (' +  codesCalculation + ')';

            TempTKProjectWorkCalculation :=  HTTPRIOTKProjectWorkCalculation as TKProjectWorkCalculationControllerSoapPort;
            TKProjectWorkCalculationList := TempTKProjectWorkCalculation.getScrollableFilteredList(tempTKProjectWorkCalculationFilter,0,10000);

             with sgTKProjectWorkCalculation do
              for i:=0 to High(TKProjectWorkCalculationList.list) do
                begin
                  Application.ProcessMessages;
                  TempENPlanProjectCalculation :=  HTTPRIOENPlanProjectCalculation as ENPlanProjectCalculationControllerSoapPort;
                  ENPlanProjectCalculationObj:=ENPlanProjectCalculation.Create;
                  SetNullIntProps(ENPlanProjectCalculationObj);
                  SetNullXSProps(ENPlanProjectCalculationObj);

                  if ENPlanProjectCalculationObj.tkProjWorkCalculation = nil then ENPlanProjectCalculationObj.tkProjWorkCalculation := TKProjectWorkCalculation.Create();
                  ENPlanProjectCalculationObj.tkProjWorkCalculation.code := TKProjectWorkCalculationList.list[i].code;

                  if ENPlanProjectCalculationObj.projectWorkRef = nil then  ENPlanProjectCalculationObj.projectWorkRef := ENPlanProjectRef.Create;
                  ENPlanProjectCalculationObj.projectWorkRef.code := newENPlanProjectCode;

                  TempENPlanProjectCalculation.add( ENPlanProjectCalculationObj  );
                end;
      end;

    end
    else
    if DialogState = dsEdit then
    begin
      //TempENPlanProject.save(ENPlanProjectObj);
    end;
  end;
end;

procedure TfrmENPlanProjectEdit.FormCreate(Sender: TObject);
begin
  inherited;
   selectedRowProjectCalculation := 1;
end;

procedure TfrmENPlanProjectEdit.updateENPlanProjectTemplate(Sender: TObject);
var
  TempENPlanProjectTemplate: ENPlanProjectTemplateControllerSoapPort;
  i: Integer;
  ENPlanProjectTemplateList: ENPlanProjectTemplateShortList;
  TemplateFilter: ENPlanProjectTemplateFilter;
  ColCount, LastCount: Integer;
  LastRow: Integer;
  selectedRow : Integer;
begin
  SetGridHeaders(ENPlanProjectTemplateHeaders, sgENPlanProjectTemplate.ColumnHeaders);
  ColCount:=100;
  TempENPlanProjectTemplate :=  HTTPRIOENPlanProjectTemplate as ENPlanProjectTemplateControllerSoapPort;

  LastRow:= 1;

     TemplateFilter := ENPlanProjectTemplateFilter.Create;
     SetNullIntProps(TemplateFilter);
     SetNullXSProps(TemplateFilter);

     TemplateFilter.planRef := ENPlanWorkRef.Create();
     TemplateFilter.planRef.code := ENPlanProjectObj.planRef.code;

  ENPlanProjectTemplateList := TempENPlanProjectTemplate.getScrollableFilteredList(TemplateFilter,0,ColCount);
  LastCount:=High(ENPlanProjectTemplateList.list);

  if LastCount > -1 then
     sgENPlanProjectTemplate.RowCount:=LastCount+2
  else
     sgENPlanProjectTemplate.RowCount:=2;

   with sgENPlanProjectTemplate do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanProjectTemplateList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanProjectTemplateList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPlanProjectTemplateList.list[i].tag;
        Cells[2,i+1] := ENPlanProjectTemplateList.list[i].elementName;
        if ENPlanProjectTemplateList.list[i].elementcode = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENPlanProjectTemplateList.list[i].elementcode);
        Cells[4,i+1] := ENPlanProjectTemplateList.list[i].userGen;
        if ENPlanProjectTemplateList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(ENPlanProjectTemplateList.list[i].dateEdit);
        LastRow:=i+1;
        sgENPlanProjectTemplate.RowCount:=LastRow+1;
      end;

    ColCount:=ColCount+1;
    sgENPlanProjectTemplate.Row:=1;

    if selectedRow <> 0 then
    begin
    if sgENPlanProjectTemplate.RowCount > selectedRow then
      sgENPlanProjectTemplate.Row := selectedRow
    else
      sgENPlanProjectTemplate.Row := sgENPlanProjectTemplate.RowCount - 1;
    end
    else
      sgENPlanProjectTemplate.Row:=1;
end;


procedure TfrmENPlanProjectEdit.UpdateMainTreeTop();
var
  TempCCNodeExt: CCNodeExtControllerSoapPort;
  CCNodeExtList: CCNodeExtShortList;
  CCNodeExtFilterObj: CCNodeExtFilter;
  currNode: TTreeNode;
  i,j: Integer;
begin
  MainTree.Items.BeginUpdate;

  if MainTree.Items.Count>0 then
  begin
      currNode:=MainTree.Items[0];
      while currNode <> nil do
      begin
         if  assigned(currNode.Data) then Dispose(currNode.Data);
         currNode:=currNode.GetNext;
      end;
  end;

  MainTree.OnChange:=nil;

  MainTree.Items.Clear;

  TempCCNodeExt :=  HTTPRIOCCNodeExt as CCNodeExtControllerSoapPort;
  CCNodeExtFilterObj := CCNodeExtFilter.Create;
  SetNullIntProps(CCNodeExtFilterObj);
  SetNullXSProps(CCNodeExtFilterObj);

  CCNodeExtFilterObj.conditionSQL:='ccnode.parentnodecode is null and ccnode.code not in (select r.code from ccren r)';
  CCNodeExtFilterObj.orderBySQL := 'ccnode.voltage desc, ccnode.name';
  CCNodeExtList := TempCCNodeExt.getScrollableFilteredList(CCNodeExtFilterObj, 0, -1);

  for i:=0 to High(CCNodeExtList.list) do
  begin
    currNode := MainTree.Items.AddObject(nil,CCNodeExtList.list[i].name,pointer(CCNodeExtList.list[i]));
    if CCNodeExtList.list[i].countChildren>0 then currNode.HasChildren:=true;
    if StrToFloat(CCNodeExtList.list[i].voltage.DecimalString)>150 then
       currNode.ImageIndex:=CCNodeExtList.list[i].nodetypeCode+9
    else
       currNode.ImageIndex:=CCNodeExtList.list[i].nodetypeCode;
    currNode.StateIndex:=-1;
    currNode.ExpandedImageIndex:=currNode.ImageIndex;
    currNode.SelectedIndex:=currNode.ImageIndex;
  end;

  MainTree.Items.EndUpdate;

end;

procedure TfrmENPlanProjectEdit.ShowNodeInTree(NodeCode: Integer);
var
    NodeExtObj: CCNodeExt;
    TreeNodeObj: TTreeNode;
    TempCCNode: CCNodeControllerSoapPort;
    nodesTree: CCNodeShortList;
    nodesFilter: CCNodeFilter;
    i: Integer;
    res: string;
begin
        TempCCNode:= HTTPRIOCCNode as CCNodeControllerSoapPort;

        if TempCCNode.getObject(NodeCode)=nil then
        begin
           ShowMessage('В поточний час такого об''єкта не існує.');
           Exit;
        end;

        if MainTree.Items.Count=0 then UpdateMainTreeTop;

        nodesFilter:= CCNodeFilter.Create;
        SetNullIntProps(nodesFilter);
        SetNullXSProps(nodesFilter);
        nodesFilter.conditionSQL:='ccnode.code in (select sit.nodewithallparents('+intToStr(NodeCode)+'))';
        //nodesFilter.orderBySQL:='ccnode.nodetypecode';
        nodesFilter.orderBySQL:='(select count(*) from sit.nodewithallparents(ccnode.code))';
        nodesTree:=TempCCNode.getScrollableFilteredList(nodesFilter,0,-1);

        for i:=0 to High(nodesTree.list) do
        begin
           if i=0 then
              TreeNodeObj:=MainTree.Items[0]
           else
              TreeNodeObj:=TreeNodeObj.getFirstChild;

           while TreeNodeObj <> nil do
           begin
             NodeExtObj:=CCNodeExt(TreeNodeObj.Data);
             if NodeExtObj.code<>nodesTree.list[i].code then
             begin
                TreeNodeObj:=TreeNodeObj.GetNextSibling;
             end
             else
             begin
               if TreeNodeObj.Count=0 then UpdateMainTreeBranch(TreeNodeObj);
               Break;
             end;
           end;

           if TreeNodeObj=nil then
           begin
             ShowMessage('Об''єкта немає в списку. Спробуйте оновити дерево або змінити фільтрацію');
             Exit;
           end;
        end;

        MainTree.Selected:=TreeNodeObj;
        MainTree.SetFocus;
end;

procedure TfrmENPlanProjectEdit.UpdateMainTreeBranch(parentNode: TTreeNode);
var
  TempCCNodeExt: CCNodeExtControllerSoapPort;
  CCNodeExtList: CCNodeExtShortList;
  CCNodeExtFilterObj: CCNodeExtFilter;
  currNode: TTreeNode;
  i,j: Integer;
begin
  if parentNode.Count>0 then Exit;

  MainTree.Items.BeginUpdate;

  TempCCNodeExt :=  HTTPRIOCCNodeExt as CCNodeExtControllerSoapPort;
  CCNodeExtFilterObj := CCNodeExtFilter.Create;
  SetNullIntProps(CCNodeExtFilterObj);
  SetNullXSProps(CCNodeExtFilterObj);

  CCNodeExtFilterObj.conditionSQL:=
     ' ccnode.parentnodecode='+IntToStr(CCNodeExtShort(parentNode.Data).code)+
     ' or ccnode.parentnormalcode='+IntToStr(CCNodeExtShort(parentNode.Data).code);
  if CCNodeExtShort(parentNode.Data).isGroup=1 then
     CCNodeExtFilterObj.conditionSQL:=CCNodeExtFilterObj.conditionSQL+
     ' or ccnode.code in (select nodecode from ccnode2nodegroup n2g where n2g.nodegrpcode='+IntToStr(CCNodeExtShort(parentNode.Data).code)+')';

  CCNodeExtFilterObj.orderBySQL := 'ccnode.voltage desc, nodeisgroup(ccnode.code) desc, ccnode.name';
  CCNodeExtList := TempCCNodeExt.getScrollableFilteredList(CCNodeExtFilterObj, 0, -1);

  for i:=0 to High(CCNodeExtList.list) do
  begin
    currNode := MainTree.Items.AddChildObject(parentNode,CCNodeExtList.list[i].name,pointer(CCNodeExtList.list[i]));
    if CCNodeExtList.list[i].countChildren>0 then currNode.HasChildren:=true;
    if CCNodeExtList.list[i].isGroup=1 then
       currNode.ImageIndex:=9
    else
    if StrToFloat(CCNodeExtList.list[i].voltage.DecimalString)>150 then
       currNode.ImageIndex:=CCNodeExtList.list[i].nodetypeCode+9
    else
       currNode.ImageIndex:=CCNodeExtList.list[i].nodetypeCode;
    currNode.StateIndex:=-1;
    currNode.ExpandedImageIndex:=currNode.ImageIndex;
    currNode.SelectedIndex:=currNode.ImageIndex;
  end;

  if parentNode.Count=0 then parentNode.HasChildren:=False;

  MainTree.Items.EndUpdate;

end;

procedure TfrmENPlanProjectEdit.updateCCtowerBySelectedNode;
var
  TempCCTower: CCTowerControllerSoapPort;
  i ,ColCount , LastCount , LastRow , k,l : Integer;
  CCTowerList: CCTowerShortList;
  TempCCTowerFil: CCTowerFilter;

  begin

  for k:=1 to sgCCTower.RowCount-1 do
   for l:=0 to sgCCTower.ColCount-1 do
     sgCCTower.Cells[l,k]:='';

  ColCount:=100;
  TempCCTower :=  HTTPRIOCCTower as CCTowerControllerSoapPort;


     TempCCTowerFil := CCTowerFilter.Create;
     SetNullIntProps(TempCCTowerFil);
     SetNullXSProps(TempCCTowerFil);

     TempCCTowerFil.feederRef:=CCFeederRef.Create;
     TempCCTowerFil.feederRef.code:= CCNodeExtShort(MainTree.Selected.Data).code;

//   with CCTowerFilter(TempCCTowerFil) do
//   begin
//      if feederCode4TowerShow>0 then
//      begin
//        if feederRef=nil then feederRef:=CCFeederRef.Create;
//        feederRef.code:=feederCode4TowerShow;
//      end;
//   end;

  CCTowerList := TempCCTower.getScrollableFilteredList(TempCCTowerFil,0,ColCount);


  LastCount:=High(CCTowerList.list);

  if LastCount > -1 then
     sgCCTower.RowCount:=LastCount+2
  else
     sgCCTower.RowCount:=2;

   with sgCCTower do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if CCTowerList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(CCTowerList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := CCTowerList.list[i].name;
        Cells[2,i+1] := CCTowerList.list[i].kindrefName;
        Cells[3,i+1] := CCTowerList.list[i].feederrefName;
        Cells[4,i+1] := CCTowerList.list[i].res;
        LastRow:=i+1;
        sgCCTower.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgCCTower.Row:=1;
end;

end.